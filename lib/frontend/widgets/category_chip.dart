import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;

  final Color labelColor, backgroundColor;

  const CategoryChip({super.key, required this.label, required this.labelColor, required this.backgroundColor});

  @override
  Widget build(BuildContext context) => Chip(
        label: Text(label),
        labelStyle: TextStyle(color: labelColor),
        backgroundColor: backgroundColor,
      );
}
