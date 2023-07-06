import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import 'package:le_grand_magazine/frontend/pages/article_detail_page.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
import 'package:le_grand_magazine/frontend/widgets/category_chip.dart';
import 'package:le_grand_magazine/frontend/widgets/recommended_article.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
// import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
// import 'package:le_grand_magazine/frontend/widgets/category_chip.dart';
import '../../backend/models/article.dart';
// import '../widgets/SwitchCategory.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _currentCategoryIndex = 0;
  dynamic categorySelected = "Afrique";
  final AutoScrollController _scrollController = AutoScrollController();
  int _visibleItemCount = 3; // Nombre initial d'éléments à afficher

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    _scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _onSeeMorePressed() {
    setState(() {
      _visibleItemCount += 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    const categories = Category.values;
    final articles = ArticleServices().articles;

    // Organiser les articles par section
    final Map<String, List<Article>> articlesBySection = {};
    for (final article in articles) {
      final section = article.category.name;
      if (!articlesBySection.containsKey(section)) {
        articlesBySection[section] = [];
      }
      articlesBySection[section]!.add(article);
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.discover,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 40)),
          Text(AppStrings.allNews,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400, color: Colors.black)),
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryChip(
                    label: categories[index].displayName(),
                    labelColor: _currentCategoryIndex == index
                        ? Colors.white
                        : Colors.red,
                    backgroundColor: _currentCategoryIndex == index
                        ? Colors.red
                        : Colors.white,
                    onTap: () {
                      setState(() {
                        _currentCategoryIndex = index;
                        categorySelected = categories[index].displayName();
                      });
                      _scrollToSection(index);
                    });
              },
              separatorBuilder: (context, _) {
                return const SizedBox(width: 5);
              },
              itemCount: categories.length,
            ),
          ),

          // Afficher les articles par section
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final sectionArticles =
                      articlesBySection[category.displayName()];
                  int sectionArticleLength = sectionArticles?.length ?? 0;
                        
                  return AutoScrollTag(
                    controller: _scrollController,
                    index: index,
                    key: ValueKey(index),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (sectionArticleLength != 0) ?
                        Text(
                          category.displayName(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ):
                        const SizedBox.shrink(),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: sectionArticleLength,
                          itemBuilder: (context, articleIndex) {
                            final article = sectionArticles![articleIndex];
                            // Affichez les articles ici
                            return articleIndex < _visibleItemCount
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                                    child: RecommendedArticle(
                                      title: article.title,
                                      category: article.category.displayName(),
                                      imageUrl: article.image,
                                      publicationDate: article.publicationDate,
                                      icon: article.isSaved
                                          ? Icons.bookmark
                                          : Icons.bookmark_outline,
                                      iconColor: article.isSaved
                                          ? Colors.red
                                          : Colors.grey,
                                      onIconPressed: () {},
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ArticleDetailPage(
                                                      article: article))),
                                    ),
                                  )
                                : const SizedBox.shrink();
                          },
                        ),
                        if (_visibleItemCount < sectionArticleLength)
                          Center(
                              child: TextButton(
                                  onPressed: _onSeeMorePressed,
                                  child: const Text(AppStrings.seeMore))),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
