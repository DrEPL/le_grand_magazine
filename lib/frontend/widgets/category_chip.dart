import 'package:flutter/material.dart';
import 'package:le_grand_magazine/frontend/themes/colors_theme.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final Color labelColor, backgroundColor;

  const CategoryChip(
      {super.key,
      required this.label,
      required this.labelColor,
      required this.backgroundColor,
      this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: onTap,
      child: Chip(
          label: Text(label),
          shape: StadiumBorder(side: BorderSide(color: ColorThemes.primarySwatch),),
          labelStyle: TextStyle(color: labelColor),
          backgroundColor: backgroundColor),
          );
}
