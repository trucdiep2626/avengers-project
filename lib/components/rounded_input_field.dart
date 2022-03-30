import 'package:avengers_project/components/constants.dart';
import 'package:avengers_project/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData? icon;
  final bool? obscureText;
  const RoundedInputField(
      {Key? key,
      required this.textController,
      required this.hintText,
      this.icon,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: textController,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Constants.textColor),
          border: InputBorder.none,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
