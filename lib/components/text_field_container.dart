import 'package:avengers_project/components/constants.dart';
import 'package:avengers_project/components/utils.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget with Utils {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: screenWidth(context) * 0.9,
      decoration: BoxDecoration(
        color: Constants.primaryLightColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
