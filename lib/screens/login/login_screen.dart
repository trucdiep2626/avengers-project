import 'dart:developer';

import 'package:avengers_project/components/rounded_button.dart';
import 'package:avengers_project/components/rounded_input_field.dart';
import 'package:avengers_project/components/utils.dart';
import 'package:avengers_project/screens/home/home_screen.dart';
import 'package:avengers_project/screens/login/login_state.dart';
import 'package:avengers_project/screens/login/login_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> with Utils {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _focusScopeNode = FocusScopeNode();

  bool _isValidForm = false;

  @override
  void initState() {
    super.initState();

    _userNameController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    super.dispose();

    _userNameController.dispose();
    _passwordController.dispose();
    _focusScopeNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
        (_) => LoginStateNotifier(
            onLoginSuccessful: () async => await _onLoginSuccessful(context),
            onLoginFailed: () async => _onLoginFailed(context)));

    return Stack(
      children: [
        FocusScope(
          node: _focusScopeNode,
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: Utils.textBold.copyWith(fontSize: 30),
                  ),
                  SizedBox(
                    height: screenWidth(context) * 0.03,
                  ),
                  RoundedInputField(
                    textController: _userNameController,
                    hintText: 'Username',
                    icon: Icons.person,
                    onEditingComplete: _focusScopeNode.nextFocus,
                  ),
                  SizedBox(
                    height: screenWidth(context) * 0.01,
                  ),
                  RoundedInputField(
                    textController: _passwordController,
                    obscureText: true,
                    hintText: 'Password',
                    icon: Icons.lock,
                    onEditingComplete: _focusScopeNode.nextFocus,
                  ),
                  SizedBox(
                    height: screenWidth(context) * 0.03,
                  ),
                  RoundedButton(
                    label: 'Login',
                    press: () {
                      FocusScope.of(context).unfocus();

                      if (!_isValidForm) {
                        _showErrorDialog(context);
                      }
                      ref.read(loginProvider.notifier).login(
                          _userNameController.text, _passwordController.text);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        ref.watch(loginProvider).showLoadingIndicator
            ? const CircularProgressIndicator()
            : const SizedBox(),
      ],
    );
  }

  void _validateForm() {
    bool isValidForm = isValidEmail(_userNameController.text) &&
        isValidPassword(_passwordController.text);
    setState(() {
      _isValidForm = isValidForm;
    });
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const AlertDialog(
              title: Text('Error'),
              content: Text('Invalid email or password!'),
            ));
  }

  Future<void> _onLoginSuccessful(BuildContext context) async {
    pushName(context, HomeScreen.routeName);
  }

  Future<void> _onLoginFailed(BuildContext context) async {
    _showErrorDialog(context);
  }
}
