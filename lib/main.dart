import 'package:avengers_project/api/session/local_storage.dart';
import 'package:avengers_project/components/routes.dart';
import 'package:avengers_project/screens/home/home_screen.dart';
import 'package:avengers_project/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool isUserLoggedIn = await LocalStorage.getUserStatus() ?? false;
  runApp(
    ProviderScope(
      child: MyApp(
        isUserLoggedIn: isUserLoggedIn,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isUserLoggedIn;
  const MyApp({Key? key, required this.isUserLoggedIn}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter AppWrite Demo',
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute:
          isUserLoggedIn ? HomeScreen.routeName : LoginScreen.routeName,
    );
  }
}
