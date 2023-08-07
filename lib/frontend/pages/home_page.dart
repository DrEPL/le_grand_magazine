// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/frontend/pages/article_detail_page.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
import 'package:le_grand_magazine/frontend/widgets/carousel.dart';
import 'package:le_grand_magazine/frontend/widgets/recommended_article.dart';
import 'package:le_grand_magazine/frontend/widgets/section_text.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../backend/models/article.dart';
import '../../backend/services/category_services.dart';
import '../themes/colors_theme.dart';
import '../widgets/category_chip.dart';
import 'breakingNews.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> breakingNews = [];
  final AutoScrollController _scrollController = AutoScrollController();
  bool _isAtTop = true;
  int _currentCategoryIndex = 0;
  dynamic categorySelected = "Afrique";
  int _visibleItemCount = 3; // Nombre initial d'éléments à afficher

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
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isAtTop = _scrollController.offset <=
            _scrollController.position.minScrollExtent;
      });
    });
  }

  final gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2);

  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleListProvider>(context);
    final articles = articleProvider.listOfArticle;
    breakingNews = [];
    final categoryProvider = Provider.of<CategoryListProvider>(context);
    final categories = categoryProvider.listOfCategory;
    // Organiser les articles par section
    final Map<String, List<Article>> articlesBySection = {};
    for (final article in articles) {
      final section = article.category.name;
      if (!articlesBySection.containsKey(section)) {
        articlesBySection[section] = [];
      }
      articlesBySection[section]!.add(article);
    }
    // for (final article in articles) {
    //   if (article.isBreakingNews) {
    //     breakingNews.add(article);
    //   }
    // }

    for (int i = 0; i < articles.length && i < 8; i++) {
      breakingNews.add(articles[i]);
    }

    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Visibility(
                    visible: breakingNews.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SectionText(
                        text: AppStrings.breakingNews,
                        onSeeMorePressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const BreakingNews()));
                        },
                        displayTextButton: true,
                      ),
                    ),
                  ),
                  const Carousel(),
                ])),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryChip(
                        label: categories[index].name,
                        labelColor: _currentCategoryIndex == index
                            ? Colors.white
                            : ColorThemes.primarySwatch,
                        backgroundColor: _currentCategoryIndex == index
                            ? ColorThemes.primarySwatch
                            : Colors.white,
                        onTap: () {
                          setState(() {
                            _currentCategoryIndex = index;
                            categorySelected = categories[index].name;
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
            )),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final category = categories[index];
                final sectionArticles = articlesBySection[category.name];
                int sectionArticleLength = sectionArticles?.length ?? 0;
                return AutoScrollTag(
                  controller: _scrollController,
                  index: index,
                  key: ValueKey(index),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: sectionArticleLength != 0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              category.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: sectionArticleLength != 0,
                          child: const SizedBox(height: 8),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: sectionArticleLength,
                          itemBuilder: (context, articleIndex) {
                            final article = sectionArticles![articleIndex];
                            // Affichez les articles ici
                            return Visibility(
                              visible: articleIndex < _visibleItemCount,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: RecommendedArticle(
                                  title: article.title,
                                  category: article.category.name,
                                  imageUrl: article.image,
                                  publicationDate: article.publicationDate,
                                  onIconPressed: () {},
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ArticleDetailPage(
                                                  article: article))),
                                ),
                              ),
                            );
                          },
                        ),
                        Visibility(
                          visible: _visibleItemCount < sectionArticleLength,
                          child: Center(
                              child: TextButton(
                                  onPressed: _onSeeMorePressed,
                                  child: const Text(AppStrings.seeMore))),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              }, childCount: categories.length),
            ),
          ],
        ),
        Visibility(
          visible: !_isAtTop,
          child: Positioned(
            bottom: 10.0,
            right: 5.0,
            child: FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              child: const Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
    );
  }
}
