import 'package:avengers_project/api/services/fcm_config.dart';
import 'package:avengers_project/components/constants.dart';
import 'package:avengers_project/components/rounded_button.dart';
import 'package:avengers_project/components/text_field_container.dart';
import 'package:avengers_project/components/utils.dart';
import 'package:avengers_project/screens/home/home_state_notifier.dart';
import 'package:avengers_project/screens/login/login_screen.dart';
import 'package:avengers_project/screens/login/login_state_notifier.dart';
import 'package:avengers_project/screens/password_change/password_change_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends ConsumerStatefulWidget with Utils {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/home';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class  _HomeScreenState extends ConsumerState<HomeScreen> with Utils{
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
    final state = ref.watch(homeProvider);

    // Example: Get email
    final user = state.data?.maybeMap((value) => value.data, orElse: (){});
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'User Profile',
          style: Utils.textBold.copyWith(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: user?.avatar == null? const CircularProgressIndicator(): Image(image: MemoryImage(user!.avatar! ),)
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.03,
                    ),
                    _buildTextField(user?.email ?? '', Icons.email),
                    _buildTextField(user?.name ?? '', Icons.person),
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
                          pushReplacementNamed(context, LoginScreen.routeName);
                        }),
                  ],
                )
              ],
            ),
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

