import 'package:avengers_project/components/constants.dart';
import 'package:avengers_project/components/rounded_button.dart';
import 'package:avengers_project/components/text_field_container.dart';
import 'package:avengers_project/components/utils.dart';
import 'package:avengers_project/model/user_model.dart';
import 'package:avengers_project/screens/home/home_state_notifier.dart';
import 'package:avengers_project/screens/login/login_screen.dart';
import 'package:avengers_project/screens/login/login_state_notifier.dart';
import 'package:avengers_project/screens/password_change/password_change_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget with Utils {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    // Example: Get email
    final email = state.data?.maybeMap(
      (value) => value.data?.email ?? '',
      orElse: () {},
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text(
          'User Profile',
          style: Utils.textBold.copyWith(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.network(
                      'https://preview.redd.it/iqim6i7wnqc61.jpg?auto=webp&s=28922ea5e3d8fa554701b7b55e52d3c4c3b50224',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(context) * 0.03,
                  ),
                  _buildTextField(email ?? '', Icons.email),
                  _buildTextField('Name', Icons.person),
                ],
              ),
              Column(
                children: [
                  RoundedButton(
                      label: 'Change password',
                      press: () =>
                          pushName(context, PasswordChangeScreen.routeName)),
                  RoundedButton(
                      label: 'Logout',
                      press: () {
                        ref.read(loginProvider.notifier).logout();
                        pushName(context, LoginScreen.routeName);
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String text, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(top: 3),
      child: TextFieldContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: Utils.textRegular.copyWith(color: Constants.textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
