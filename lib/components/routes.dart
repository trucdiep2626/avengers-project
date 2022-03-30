import 'package:avengers_project/screens/home/home_screen.dart';
import 'package:avengers_project/screens/login/login_screen.dart';
import 'package:avengers_project/screens/password_change/password_change_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (_) => const LoginScreen(),
  HomeScreen.routeName: (_) => const HomeScreen(),
  PasswordChangeScreen.routeName: (_) => const PasswordChangeScreen(),
};
