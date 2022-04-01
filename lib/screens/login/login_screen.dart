
import 'package:avengers_project/components/rounded_button.dart';
import 'package:avengers_project/components/rounded_input_field.dart';
import 'package:avengers_project/components/utils.dart';
import 'package:avengers_project/screens/home/home_screen.dart';
import 'package:avengers_project/screens/login/login_state.dart';
import 'package:avengers_project/screens/login/login_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LoginScreen extends ConsumerStatefulWidget {
  static String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> with Utils {
 

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final loginProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
        (_) => LoginStateNotifier(
            onLoginSuccessful: () async => await _onLoginSuccessful(context),
            onLoginFailed: () async => _onLoginFailed(context)));

    return Scaffold(
      body: SafeArea(
        child: Center(
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
                textController: userNameController,
                hintText: 'Username',
                icon: Icons.person,
              ),
              SizedBox(
                height: screenWidth(context) * 0.01,
              ),
              RoundedInputField(
                textController: passwordController,
                obscureText: true,
                hintText: 'Password',
                icon: Icons.lock,
              ),
              SizedBox(
                height: screenWidth(context) * 0.03,
              ),
              RoundedButton(
                label: 'Login',
                press: () {
                  ref
                      .read(loginProvider.notifier)
                      .login(userNameController.text, passwordController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onLoginSuccessful(BuildContext context) async {
    pushName(context, HomeScreen.routeName);
  }

  Future<void> _onLoginFailed(BuildContext context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Login failed!')));
  }
}
