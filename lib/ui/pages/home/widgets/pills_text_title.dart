import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicines/config/constants/colors.dart';

class PillsTextTitle extends StatelessWidget {
  final String text;

  const PillsTextTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [Text(text, style: const TextStyle(color: mainButton,fontSize: 20.0),)]),
        const Divider(
          color: mainButton,
          thickness: 2,
        )
      ],
    );
  }
}
