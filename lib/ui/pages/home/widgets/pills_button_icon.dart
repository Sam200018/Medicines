import 'package:flutter/material.dart';
import 'package:medicines/config/constants/colors.dart';

class PillsButtonIcon extends StatelessWidget {
  final VoidCallback? onPress;
  final Color color;
  final Color textColor;
  final String text;
  final double width;
  final double height;
  final IconData icon;
  final double iconSize;

  const PillsButtonIcon({
    super.key,
    required this.onPress,
    required this.text,
    this.width = double.maxFinite,
    required this.height,
    required this.color,
    this.textColor = Colors.black,
    required this.icon,
    required this.iconSize,
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
            disabledBackgroundColor: mainButtonDisable),
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Icon(
              icon,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
