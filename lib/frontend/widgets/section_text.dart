import 'package:flutter/material.dart';

class SectionText extends StatelessWidget {

  final String text;

  final Function()? onSeeMorePressed;

  const SectionText({super.key, required this.text, required this.onSeeMorePressed});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.titleLarge),
          TextButton(onPressed: onSeeMorePressed, child: const Text("Voir plus")),
        ],
      ),
    );
}