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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Image.asset("assets/images/logo.png", width: 100, height: 100),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.black)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined, color: Colors.black))
          ],
        ),
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
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 25,
          currentIndex: currentPage,
          onTap: (index) => setState(() => currentPage = index),
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.language), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
          ],
        ),
      ),
    );
  }
}
