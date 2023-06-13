import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/services/article_service.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int activeIndex = 0;

  final articles = ArticleService().articles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: articles.length,
          options: CarouselOptions(
            height: 280,
            initialPage: 0,
            autoPlayInterval: const Duration(seconds: 2),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) => setState(() => activeIndex = index),
          ),
          itemBuilder: (context, index, realIndex) {
            final image = articles[index];

            return Stack(children: [_buildImage(index), _buildCategory(index, context), _buildTimeAndTitle(context, index)]);
          },
        ),
        const SizedBox(height: 24),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: articles.length,
          effect: ExpandingDotsEffect(
            activeDotColor: Theme.of(context).primaryColor,
            dotHeight: 5,
            dotWidth: 5,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeAndTitle(BuildContext context, int index) {
    final time = DateTime.now().difference(articles[index].publicationDate);
    return Positioned(
      top: 190,
      left: 15,
      right: 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Il y a ${time.inMinutes} minutes", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 11)),
          const SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              articles[index].title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildCategory(int index, BuildContext context) {
    return Positioned(
      top: 15,
      left: 15,
      child: Container(
        height: 26,
        decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(articles[index].category.displayName().toUpperCase(), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 10)),
        ),
      ),
    );
  }

  Widget _buildImage(int index) => ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Container(
          height: 280,
          width: 2000,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(articles[index].image), fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0.0, 1],
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      );
}
