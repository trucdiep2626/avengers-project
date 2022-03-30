import 'package:avengers_project/components/rounded_button.dart';
import 'package:avengers_project/components/utils.dart';
import 'package:avengers_project/screens/login/login_screen.dart';
import 'package:avengers_project/screens/password_change/password_change_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget with Utils {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text('Home Screen'),
                  SizedBox(
                    height: screenHeight(context) * 0.01,
                  ),
                  RoundedButton(
                      label: 'Change password',
                      press: () =>
                          pushName(context, PasswordChangeScreen.routeName)),
                ],
              ),
              RoundedButton(
                  label: 'Logout',
                  press: () => pushName(context, LoginScreen.routeName)),
            ],
          ),
        ),
      ),
    );
  }
}
