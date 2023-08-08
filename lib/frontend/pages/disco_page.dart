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
import 'breakingNews.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final AutoScrollController _scrollController = AutoScrollController();
  List<Article> breakingNews = [];
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

  List<GlobalKey<State<StatefulWidget>>> sectionKeys = [];

  void _scrollToSection(int index) {
  RenderObject? renderObject =
      sectionKeys[index].currentContext?.findRenderObject();
  if (renderObject is RenderBox) {
    _scrollController.animateTo(
      _scrollController.offset + renderObject.localToGlobal(Offset.zero).dy,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}


  final gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2);

  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleListProvider>(context);
    final articles = articleProvider.listOfArticle;
    breakingNews = [];
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
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
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
 
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SectionText(
                  text: AppStrings.recommendation,
                  onSeeMorePressed: () {
                    const DiscoverPage();
                  },
                  displayTextButton: false,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RecommendedArticle(
                      title: articles[index].title,
                      category: articles[index].category.name,
                      imageUrl: articles[index].image,
                      publicationDate: articles[index].publicationDate,
                      onIconPressed: () {},
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ArticleDetailPage(article: articles[index]))),
                    ),
                  );
                },
                separatorBuilder: (context, _) => const SizedBox(height: 5),
                itemCount: articles.length,
              )
            ],
          ),
        ),
        Visibility(
          visible: !_isAtTop,
          child: Positioned(
            bottom: 16.0,
            right: 16.0,
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
