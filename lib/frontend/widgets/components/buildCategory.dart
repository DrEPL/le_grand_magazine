import 'package:flutter/material.dart';
import 'package:le_grand_magazine/frontend/themes/colors_theme.dart';
import '../../../backend/models/article.dart';

Positioned buildCategory(
    int index, BuildContext context, List<Article> articles) {
  return Positioned(
    top: 15,
    left: 15,
    child: Container(
      height: 30,
      decoration: BoxDecoration(color: ColorThemes.primarySwatch,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(articles[index].category.name.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white, fontSize: 10)),
      ),
    ),
  );
}
