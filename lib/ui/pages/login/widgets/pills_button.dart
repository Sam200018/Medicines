import 'package:flutter/material.dart';

class PillsButton extends StatelessWidget {
  final VoidCallback? onPress;
  final Color color;
  final Color textColor;
  final String text;
  final double width;
  final double height;

  const PillsButton({
    super.key,
    required this.onPress,
    required this.text,
    this.width = double.maxFinite,
    required this.height,
    required this.color,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
