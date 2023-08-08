import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import 'package:le_grand_magazine/frontend/themes/colors_theme.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
import 'package:le_grand_magazine/frontend/widgets/category_chip.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../utils/function.dart';
import '../widgets/recommended_article.dart';
import 'article_detail_page.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _currentCategoryIndex = 0;
  dynamic categorySelected = "Toutes";
  final AutoScrollController _scrollController = AutoScrollController();
  bool _isAtTop = true;

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

  @override
  Widget build(BuildContext context) {
    const categories = Category.values;
    final articleProvider = Provider.of<ArticleListProvider>(context);
    final articles = articleProvider.listOfArticle;

    return RefreshIndicator(
      onRefresh: () async {
        CategoryProvider(context);
        ArticleProvider(context);
        debugPrint("Fetch de l'api après en tirant vers le bas.");
      },
      child: Padding(
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
                          : ColorThemes.primarySwatch,
                      backgroundColor: _currentCategoryIndex == index
                          ? ColorThemes.primarySwatch
                          : Colors.white,
                      onTap: () {
                        setState(() {
                          _currentCategoryIndex = index;
                          categorySelected = categories[index].displayName();
                        });
                      });
                },
                separatorBuilder: (context, _) {
                  return const SizedBox(width: 5);
                },
                itemCount: categories.length,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    physics: const ClampingScrollPhysics(),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return categorySelected == articles[index].category.name
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: RecommendedArticle(
                                  title: articles[index].title,
                                  category: articles[index].category.name,
                                  imageUrl: articles[index].image,
                                  publicationDate:
                                      articles[index].publicationDate,
                                  onIconPressed: () {},
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ArticleDetailPage(
                                                  article: articles[index]))),
                                ),
                              )
                            : categorySelected == "Toutes"
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: RecommendedArticle(
                                      title: articles[index].title,
                                      category: articles[index].category.name,
                                      imageUrl: articles[index].image,
                                      publicationDate:
                                          articles[index].publicationDate,
                                      onIconPressed: () {},
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ArticleDetailPage(
                                                      article:
                                                          articles[index]))),
                                    ),
                                  )
                                : const SizedBox.shrink();
                      },
                      separatorBuilder: (context, _) => const SizedBox.shrink(),
                      itemCount: articles.length,
                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
