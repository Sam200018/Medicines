import 'package:flutter/material.dart';

class PillsInput extends StatelessWidget {
  final TextEditingController textController;
  final TextInputType textInputType;
  final bool obscureText;
  final String labelText;
  final String errorText;

  const PillsInput({
    super.key,
    required this.textController,
    required this.textInputType,
    this.obscureText = false,
    required this.labelText,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText.isNotEmpty ? errorText : null,
      ),
    );
  }
}