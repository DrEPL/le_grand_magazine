import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/article.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/frontend/pages/article_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'components/buildCategory.dart';
import 'components/buildImage.dart';
import 'components/buildTimeAndTitle.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int activeIndex = 0;
  List<Article> breakingNews = [];

  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleListProvider>(context);

    return FutureBuilder<List<Article>>(
      future: articleProvider.listOfArticles(), 
      // Utilisez ici la future pour récupérer les articles
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Pendant l'attente des articles, affichez le CircularProgressIndicator
          return Container(height: 280, color: Colors.grey[100],);
        } else if (snapshot.hasError) {
          // Gérez les erreurs éventuelles
          return const Center(
            child: Text('Erreur lors du chargement des articles'),
          );
        } else {
          // Récupérez les articles à partir du snapshot et continuez avec le reste du code
          final articles = snapshot.data ?? []; // Utilisez une liste vide par défaut si les articles sont null
          breakingNews = [];
          for (final article in articles) {
            if (article.isBreakingNews) {
              breakingNews.add(article);
            }
          }

          return StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: breakingNews.length,
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 280,
                      initialPage: 0,
                      autoPlayInterval: const Duration(seconds: 9),
                      enlargeCenterPage: true,
                      onPageChanged: (index, _) =>
                          setState(() => activeIndex = index),
                    ),
                    itemBuilder: (context, index, _) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ArticleDetailPage(
                                        article: breakingNews[index]))),
                        child: Stack(
                          children: [
                            buildImage(index, breakingNews),
                            buildCategory(index, context, breakingNews),
                            buildTimeAndTitle(context, index, breakingNews)
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: breakingNews.length,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Theme.of(context).primaryColor,
                        dotHeight: 5,
                        dotWidth: 5),
                  ),
                ],
              );
            }
          );
        }
      },
    );
  }
}
