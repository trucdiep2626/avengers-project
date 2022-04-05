import 'package:avengers_project/components/constants.dart';
import 'package:flutter/cupertino.dart';

mixin Utils {
  void pushName(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void pushReplacementNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.of(context).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  bool isValidEmail(String email) {
    return email.isNotEmpty ||
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 8;
  }

  double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // text style
  static const TextStyle textRegular = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: Constants.primaryColor,
  );

  static final TextStyle textMedium = textRegular.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle textBold = textRegular.copyWith(
    fontWeight: FontWeight.w700,
  );
}
