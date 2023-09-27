import 'package:flutter/material.dart';
import 'package:medicines/config/constants/colors.dart';

class PillsTextButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback onPress;

  const PillsTextButton(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        text,
        style:
            TextStyle(fontSize: fontSize, decoration: TextDecoration.underline, decorationColor: mainButton),
      ),
    );
  }
}
