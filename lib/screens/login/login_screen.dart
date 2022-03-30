import 'package:avengers_project/components/rounded_button.dart';
import 'package:avengers_project/components/rounded_input_field.dart';
import 'package:avengers_project/components/utils.dart';
import 'package:avengers_project/screens/home/home_screen.dart';
import 'package:avengers_project/services/fcm_config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Utils {
  @override
  void initState() {
    super.initState();
    FcmConfig.initMessage(onSelectNotification);
  }

  void onSelectNotification(String? mess) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Notification"),
          content: Text("$mess"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();

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
                press: () => pushName(context, HomeScreen.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
