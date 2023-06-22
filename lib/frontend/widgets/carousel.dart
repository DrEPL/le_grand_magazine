import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: articles.length,
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
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ArticleDetailPage(article: articles[index]))),
              child: Stack(
                children: [buildImage(index, articles), buildCategory(index, context, articles), buildTimeAndTitle(context, index, articles)],
              ),
            );
          },
        ),
        const SizedBox(height: 25),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: articles.length,
          effect: ExpandingDotsEffect(activeDotColor: Theme.of(context).primaryColor, dotHeight: 5, dotWidth: 5),
        ),
      ],
    );
  }
}
