import 'package:avengers_project/components/constants.dart';
import 'package:avengers_project/components/rounded_button.dart';
import 'package:avengers_project/components/rounded_input_field.dart';
import 'package:avengers_project/components/utils.dart';
import 'package:avengers_project/screens/login/login_screen.dart';
import 'package:avengers_project/screens/login/login_state_notifier.dart';
import 'package:avengers_project/screens/password_change/password_change_state.dart';
import 'package:avengers_project/screens/password_change/password_change_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordChangeScreen extends ConsumerStatefulWidget {
  const PasswordChangeScreen({Key? key}) : super(key: key);

  static String routeName = '/password_change';

  @override
  _PasswordChangeScreenState createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends ConsumerState<PasswordChangeScreen>
    with Utils {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _focusScopeNode = FocusScopeNode();

  bool _isValidForm = false;

  @override
  void initState() {
    super.initState();

    _currentPasswordController.addListener(_validateForm);
    _newPasswordController.addListener(_validateForm);
    _confirmPasswordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    super.dispose();

    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _focusScopeNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passwordChangeProvider =
        StateNotifierProvider<PasswordChangeStateNotifier, PasswordChangeState>(
            (_) => PasswordChangeStateNotifier(
                onChangeSuccessful: () => _onChangeSuccessful(context, ref),
                onChangeFailed: () => _onChangeFailed(context)));

    return FocusScope(
      node: _focusScopeNode,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          title: Text(
            'Change Password',
            style: Utils.textBold.copyWith(fontSize: 25, color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current password',
                        style: Utils.textMedium,
                      ),
                      RoundedInputField(
                        textController: _currentPasswordController,
                        hintText: 'Current password',
                        icon: Icons.lock,
                        onEditingComplete: _focusScopeNode.nextFocus,
                      ),
                      SizedBox(
                        height: screenWidth(context) * 0.02,
                      ),
                      Text(
                        'New password',
                        style: Utils.textMedium,
                      ),
                      RoundedInputField(
                        textController: _newPasswordController,
                        hintText: 'New password',
                        icon: Icons.lock,
                        onEditingComplete: _focusScopeNode.nextFocus,
                      ),
                      SizedBox(
                        height: screenWidth(context) * 0.02,
                      ),
                      Text(
                        'Confirm new password',
                        style: Utils.textMedium,
                      ),
                      RoundedInputField(
                        textController: _confirmPasswordController,
                        hintText: 'Confirm new password',
                        icon: Icons.lock,
                        onEditingComplete: _focusScopeNode.nextFocus,
                      ),
                    ],
                  ),
                  RoundedButton(
                    label: 'Change Password',
                    press: () {
                      FocusScope.of(context).unfocus();

                      if (!_isValidForm) {
                        _showErrorDialog(context);
                      }

                      ref.read(passwordChangeProvider.notifier).changePassword(
                          _currentPasswordController.text,
                          _newPasswordController.text,
                          _confirmPasswordController.text);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    bool isValidForm = isValidPassword(_currentPasswordController.text) &&
        isValidPassword(_newPasswordController.text) &&
        _newPasswordController.text == _confirmPasswordController.text;
    setState(() {
      _isValidForm = isValidForm;
    });
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const AlertDialog(
              title: Text('Error'),
              content: Text('Change password failed!'),
            ));
  }

  Future<void> _onChangeSuccessful(BuildContext context, WidgetRef ref) async {
    ref.read(loginProvider.notifier).logout();
    pushReplacementNamed(context, LoginScreen.routeName);
  }

  Future<void> _onChangeFailed(BuildContext context) async {
    _showErrorDialog(context);
  }
}
