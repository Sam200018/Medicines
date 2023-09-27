import 'package:flutter/material.dart';
import 'package:medicines/config/constants/colors.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: mainButton
      );
}
