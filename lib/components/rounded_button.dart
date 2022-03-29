import 'package:avengers_project/components/constants.dart';
import 'package:avengers_project/components/utils.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget with Utils {
  final String label;
  final VoidCallback press;
  const RoundedButton({Key? key, required this.label, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: screenWidth(context) * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ElevatedButton(
          child: Text(
            label,
            style: Utils.textMedium.copyWith(color: Colors.white),
          ),
          onPressed: press,
          style: ElevatedButton.styleFrom(
            primary: Constants.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
        ),
      ),
    );
  }
}
