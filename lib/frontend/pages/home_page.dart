import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/services/article_service.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
import 'package:le_grand_magazine/frontend/widgets/carousel.dart';
import 'package:le_grand_magazine/frontend/widgets/recommended_article.dart';
import 'package:le_grand_magazine/frontend/widgets/section_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  final articles = ArticleService().articles;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SectionText(text: AppStrings.breakingNews, onSeeMorePressed: () {}),
              const Carousel(),
              SectionText(text: AppStrings.recommendation, onSeeMorePressed: () {}),
              ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RecommendedArticle(
                      title: articles[index].title,
                      category: articles[index].category.displayName(),
                      imageUrl: articles[index].image,
                      publicationDate: articles[index].publicationDate,
                      icon: articles[index].isSaved ? Icons.bookmark : Icons.bookmark_outline,
                      iconColor: articles[index].isSaved ? Colors.red : Colors.grey,
                      onIconPressed: () {},
                    );
                  },
                  separatorBuilder: (context, _) => const SizedBox(height: 5),
                  itemCount: articles.length),
            ],
          ),
        ),
      ),
    );
  }
}
