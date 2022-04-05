import 'package:avengers_project/components/constants.dart';
import 'package:avengers_project/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData? icon;
  final bool? obscureText;
  final VoidCallback? onEditingComplete;
  const RoundedInputField(
      {Key? key,
      required this.textController,
      required this.hintText,
      this.icon,
      this.obscureText,
      this.onEditingComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: textController,
        obscureText: obscureText ?? false,
        onEditingComplete: onEditingComplete,
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
