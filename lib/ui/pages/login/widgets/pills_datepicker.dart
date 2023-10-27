
import 'package:flutter/material.dart';

class PillsDatePicker extends StatelessWidget {
  final TextEditingController ctrl;
  final VoidCallback? onTap;

  const PillsDatePicker({super.key, required this.ctrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onTap, icon: const Icon(Icons.date_range_outlined)),
        SizedBox(
          width: 300.0,
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: ctrl,
            readOnly: true,
            onTap: onTap,
          ),
        )
      ],
    );
  }
}
