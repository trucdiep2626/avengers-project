import 'package:avengers_project/components/constants.dart';
import 'package:avengers_project/components/rounded_button.dart';
import 'package:avengers_project/components/rounded_input_field.dart';
import 'package:avengers_project/components/utils.dart';
import 'package:avengers_project/screens/login/login_screen.dart';
import 'package:avengers_project/screens/password_change/password_change_state.dart';
import 'package:avengers_project/screens/password_change/password_change_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordChangeScreen extends ConsumerWidget with Utils {
  const PasswordChangeScreen({Key? key}) : super(key: key);

  static String routeName = '/password_change';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    final passwordChangeProvider =
        StateNotifierProvider<PasswordChangeStateNotifier, PasswordChangeState>(
            (_) => PasswordChangeStateNotifier(
                onChangeSuccessful: () => _onChangeSuccessful(context),
                onChangeFailed: () => _onChangeFailed(context)));

    return Scaffold(
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
                      textController: currentPasswordController,
                      hintText: 'Current password',
                      icon: Icons.lock,
                    ),
                    SizedBox(
                      height: screenWidth(context) * 0.02,
                    ),
                    Text(
                      'New password',
                      style: Utils.textMedium,
                    ),
                    RoundedInputField(
                      textController: newPasswordController,
                      hintText: 'New password',
                      icon: Icons.lock,
                    ),
                    SizedBox(
                      height: screenWidth(context) * 0.02,
                    ),
                    Text(
                      'Confirm new password',
                      style: Utils.textMedium,
                    ),
                    RoundedInputField(
                      textController: confirmPasswordController,
                      hintText: 'Confirm new password',
                      icon: Icons.lock,
                    ),
                  ],
                ),
                RoundedButton(
                    label: 'Change Password',
                    press: () => ref
                        .read(passwordChangeProvider.notifier)
                        .changePassword(
                            currentPasswordController.text,
                            newPasswordController.text,
                            confirmPasswordController.text)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onChangeSuccessful(BuildContext context) async {
    pushName(context, LoginScreen.routeName);
  }

  Future<void> _onChangeFailed(BuildContext context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Change password failed!')));
  }
}
