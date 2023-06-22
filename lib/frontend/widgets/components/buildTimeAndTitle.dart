  import 'package:flutter/material.dart';
import '../../../backend/models/article.dart';

Widget buildTimeAndTitle(BuildContext context, int index, List<Article> articles) {
    final time = DateTime.now().difference(articles[index].publicationDate);
    return Positioned(
      top: 190,
      left: 15,
      right: 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(displayTime(time: time), style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 11)),
          const SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              articles[index].title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  String displayTime({required Duration time}) {
    if (time.inSeconds < 60) {
      return "Il y a ${time.inSeconds} secondes";
    }

    if (time.inMinutes < 60) {
      return "Il y a ${time.inMinutes} minutes";
    }

    if (time.inMinutes >= 60) {
      return "Plutôt dans la journée";
    }

    return "";
  }