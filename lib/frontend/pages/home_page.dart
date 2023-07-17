// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/backend/services/video_services.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import 'package:le_grand_magazine/frontend/pages/article_detail_page.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
import 'package:le_grand_magazine/frontend/widgets/carousel.dart';
import 'package:le_grand_magazine/frontend/widgets/recommended_article.dart';
import 'package:le_grand_magazine/frontend/widgets/section_text.dart';
import 'package:video_player/video_player.dart';

import 'breakingNews.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final articles = ArticleServices().articles;
  late VideoPlayerController _videoController;
  // final videos = VideoServices().videos;
    final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    // Ajoutez d'autres URLs de vidéos selon vos besoins
  ];

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    )..initialize().then((_) {
        setState(() {});
      });
  }

  final gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2);

  @override
  void dispose() {
    // Libérez les ressources des contrôleurs vidéo
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SectionText(
              text: AppStrings.breakingNews,
              onSeeMorePressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const BreakingNews()));
              }),
          const Carousel(),
          SectionText(
              text: AppStrings.videos,
              onSeeMorePressed: () {}), // Ajout de la section "Videos"
          SizedBox(
              height:
                  200, // Hauteur souhaitée de la liste horizontale de vidéos
              child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1, // Remplacez par le nombre de vidéos que vous souhaitez afficher
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_videoController.value.isPlaying) {
                          _videoController.pause();
                        } else {
                          _videoController.play();
                        }
                      });
                    },
                      child: AspectRatio(
                        aspectRatio: _videoController.value.aspectRatio,
                        child: VideoPlayer(_videoController),
                      ),
                    ),
                  );
                  }
              )),
          SectionText(text: AppStrings.recommendation, onSeeMorePressed: () {}),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: RecommendedArticle(
                  title: articles[index].title,
                  category: articles[index].category.displayName(),
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
    );
  }
}
