import 'package:flutter/material.dart';

class PillsSnackbar extends SnackBar {
  PillsSnackbar({
    Key? key,
    required String message,
    Color? backgroundColor,
    TextStyle? textStyle,
    Duration duration = const Duration(seconds: 3),
  }) : super(
    key: key,
    backgroundColor: backgroundColor ?? Colors.red,
    content: Text(
      message,
      style: textStyle ?? const TextStyle(color: Colors.black),
    ),
    duration: duration,
  );
}
