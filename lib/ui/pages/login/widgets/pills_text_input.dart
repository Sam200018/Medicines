import 'package:flutter/material.dart';

class PillsTextInput extends StatelessWidget {
  final String label;
  final String unit;
  final TextEditingController textController;
  final String errorText;
  final Function(String)? onChanged;

  const PillsTextInput(
      {super.key,
      required this.label,
      required this.unit,
      required this.textController,
      required this.errorText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label),
        SizedBox(
          width: 80.0,
          child: TextFormField(
            controller: textController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                errorText: errorText.isNotEmpty ? errorText : null),
            onChanged: onChanged,
          ),
        ),

        Text(unit)
      ],
    );
  }
}
