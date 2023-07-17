import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/article.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/frontend/pages/article_detail_page.dart';
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

  final articles = ArticleServices().articles;
  List<Article> breakingNews = [];

  @override
  Widget build(BuildContext context) {
    // Trier les BreakinkNews des articles
    breakingNews = [];
    for (final article in articles) {
      if (article.isBreakingNews) {
        breakingNews.add(article);
      }
    }
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
            onPageChanged: (index, _) => setState(() => activeIndex = index),
          ),
          itemBuilder: (context, index, _) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ArticleDetailPage(article: breakingNews[index]))),
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
}
