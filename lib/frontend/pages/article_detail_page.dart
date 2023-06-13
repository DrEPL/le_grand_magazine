import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/article.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import 'package:le_grand_magazine/frontend/widgets/category_chip.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final time = DateTime.now().difference(article.publicationDate);
    return Scaffold(
      body: Column(
        children: [
          _buildImage(context, time),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 475,
              child: ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  Text(article.summary, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  const SizedBox(height: 10),
                  Text(article.content),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, Duration time) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(article.image), fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: const [0.0, 1],
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new, size: 25, color: Colors.white)),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(article.isSaved ? Icons.bookmark : Icons.bookmark_outline, size: 25, color: article.isSaved ? Colors.red : Colors.white),
                  ),
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.more_horiz, size: 25, color: Colors.white)),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 230,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryChip(label: article.category.displayName(), labelColor: Colors.white, backgroundColor: Colors.red),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          article.title,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
                          softWrap: true,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(displayTime(time: time), style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
}
