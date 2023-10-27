import 'package:flutter/material.dart';

class PillsInput extends StatelessWidget {
  final TextEditingController textController;
  final TextInputType textInputType;
  final bool obscureText;
  final String labelText;
  final String errorText;
  final int? minLines;
  final int? maxLines;
  final Function(String)? onChanged;

  const PillsInput({
    super.key,
    required this.textController,
    required this.textInputType,
    this.obscureText = false,
    required this.labelText,
    required this.errorText,
    this.onChanged,
    this.minLines,
    this.maxLines,
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
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChanged,
    );
  }
}
