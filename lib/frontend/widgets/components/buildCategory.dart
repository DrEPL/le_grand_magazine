  import 'package:flutter/material.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import '../../../backend/models/article.dart';

Positioned buildCategory(int index, BuildContext context, List<Article> articles) {
    return Positioned(
      top: 15,
      left: 15,
      child: Container(
        height: 26,
        decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(articles[index].category.displayName().toUpperCase(), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 10)),
        ),
      ),
    );
  }