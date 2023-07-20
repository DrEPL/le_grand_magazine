
import 'package:flutter/material.dart';
import '../../../backend/models/article.dart';

Widget buildImage(int index, List<Article> articles) => ClipRRect(
  borderRadius: BorderRadius.circular(26),
  child: Container(
    height: 280,
    width: 2000,
    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(articles[index].image), fit: BoxFit.cover)),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: const [0.0, 1],
          begin: Alignment.bottomRight,
          colors: [
            Colors.black.withOpacity(1),
            Colors.transparent,
          ],
        ),
      ),
    ),
  ),
);