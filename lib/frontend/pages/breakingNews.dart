import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/article.dart';

import '../../backend/services/article_services.dart';
import '../utils/app_strings.dart';
import '../widgets/components/buildCategory.dart';
import '../widgets/components/buildImage.dart';
import '../widgets/components/buildTimeAndTitle.dart';
import 'article_detail_page.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  final articles = ArticleServices().articles;
  List<Article> breakingNews = [];
  final gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 3/2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10);
  @override
  Widget build(BuildContext context) {
  // Trier les BreakinkNews des articles
  breakingNews = [];
  for (final article in articles) {
    if (article.isBreakingNews) {
      breakingNews.add(article);
    }
  }
  return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.breakingNews, style: TextStyle(color: Colors.black, fontSize: 24)),
        backgroundColor: Colors.white,
        leading: const BackButton( color: Colors.black,),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: 
        GridView.builder(gridDelegate: gridDelegate,
            itemCount: breakingNews.length,
            itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ArticleDetailPage(article: breakingNews[index]))),
              child: Stack(
                children: [buildImage(index, breakingNews), buildCategory(index, context, breakingNews), buildTimeAndTitle(context, index, breakingNews)],
              ),
            );
          },)
      ),
    );
  }
}

// GridView.builder(gridDelegate: gridDelegate,
//             itemCount: articles.length,
//             itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ArticleDetailPage(article: articles[index]))),
//               child: Stack(
//                 children: [buildImage(index, articles), buildCategory(index, context, articles), buildTimeAndTitle(context, index, articles)],
//               ),
//             );
//           },)