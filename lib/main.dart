import 'package:avengers_project/components/routes.dart';
import 'package:avengers_project/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter AppWrite Demo',
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: LoginScreen.routeName,
    );
  }
}
