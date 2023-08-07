import 'package:flutter/material.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';

class SectionText extends StatelessWidget {
  final String text;
  final bool displayTextButton;
  final Function()? onSeeMorePressed;

  const SectionText(
      {super.key,
      required this.text,
      required this.onSeeMorePressed,
      required this.displayTextButton});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: const TextStyle(fontFamily: 'DIN',
                fontSize: 20),
                strutStyle: const StrutStyle(fontWeight: FontWeight.bold),
                softWrap: true),
            displayTextButton
                ? TextButton(
                    onPressed: onSeeMorePressed,
                    child: const Text(AppStrings.seeMore))
                : const SizedBox.shrink(),
          ],
        ),
      );
}
