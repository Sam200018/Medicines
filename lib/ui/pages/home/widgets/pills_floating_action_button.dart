import 'package:flutter/material.dart';

class PillsFloatingActionButton extends StatelessWidget {
  final String tooltip;
  final VoidCallback? onPress;
  final Widget label;

  const PillsFloatingActionButton(
      {super.key, this.onPress, required this.label, required this.tooltip});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: tooltip,
      onPressed: onPress,
      label: label,
    );
  }
}
