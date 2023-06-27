import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import 'package:le_grand_magazine/frontend/pages/article_detail_page.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
import 'package:le_grand_magazine/frontend/widgets/carousel.dart';
import 'package:le_grand_magazine/frontend/widgets/recommended_article.dart';
import 'package:le_grand_magazine/frontend/widgets/section_text.dart';

import 'breakingNews.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final articles = ArticleServices().articles;

  final gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SectionText(text: AppStrings.breakingNews, onSeeMorePressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const BreakingNews()));
          }),
          const Carousel(),
          SectionText(text: AppStrings.recommendation, onSeeMorePressed: () {}),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: 
                  RecommendedArticle(
                    title: articles[index].title,
                    category: articles[index].category.displayName(),
                    imageUrl: articles[index].image,
                    publicationDate: articles[index].publicationDate,
                    icon: articles[index].isSaved ? Icons.bookmark : Icons.bookmark_outline,
                    iconColor: articles[index].isSaved ? Colors.red : Colors.grey,
                    onIconPressed: () {},
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ArticleDetailPage(article: articles[index]))),
                  ),
              );
            },
            separatorBuilder: (context, _) => const SizedBox(height: 5),
            itemCount: articles.length,
          )
        ],
      ),
    );
  }
}
