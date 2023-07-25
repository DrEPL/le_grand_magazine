// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/video.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/backend/services/video_services.dart';
import 'package:le_grand_magazine/frontend/pages/article_detail_page.dart';
import 'package:le_grand_magazine/frontend/pages/discover_page.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
import 'package:le_grand_magazine/frontend/widgets/carousel.dart';
import 'package:le_grand_magazine/frontend/widgets/recommended_article.dart';
import 'package:le_grand_magazine/frontend/widgets/section_text.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:video_player/video_player.dart';
import 'breakingNews.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Video> videoUrls = [];
  List<VideoPlayerController> _controllers = [];
  List<bool> _isPlaying = [];
  Timer? _timer;
  final AutoScrollController _scrollController = AutoScrollController();
  final Duration _refreshDuration = const Duration(
      minutes: 4); // Temps d'attente avant chaque rafraîchissement
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayers();
    _timer = Timer.periodic(_refreshDuration, (_) {
      _resetVideoPlayers();
      debugPrint("Fetch de l'image après $_refreshDuration minutes.");
    });
    _scrollController.addListener(() {
      setState(() {
        _isAtTop = _scrollController.offset <=
            _scrollController.position.minScrollExtent;
      });
    });
  }

  void _initializeVideoPlayers() async {
    final videoProvider =
        Provider.of<VideoListProvider>(context, listen: false);
    videoUrls = await videoProvider.listOfVideos();

    for (final video in videoUrls) {
      final controller = VideoPlayerController.network(video.video_link);
      await controller.initialize();
      setState(() {
        _controllers.add(controller);
        // Défaut : la vidéo n'est pas en cours de lecture
        _isPlaying.add(false);
      });
    }
  }

  final gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2);

  @override
  void dispose() {
    _timer?.cancel();
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _playPauseVideo(int index) {
    setState(() {
      for (var i = 0; i < _controllers.length; i++) {
        if (i != index) {
          _controllers[i].pause();
          _isPlaying[i] = false;
        }
      }

      if (_isPlaying[index]) {
        _controllers[index].pause();
      } else {
        _controllers[index].play();
      }
      _isPlaying[index] = !_isPlaying[index];
    });
  }

  void _resetVideoPlayers() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    _controllers.clear();
    _isPlaying.clear();
    _initializeVideoPlayers();
  }

  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleListProvider>(context);
    final articles = articleProvider.listOfArticle;
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              articles.isNotEmpty
                  ? SectionText(
                      text: AppStrings.breakingNews,
                      onSeeMorePressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const BreakingNews()));
                      },
                      displayTextButton: true,
                    )
                  : const SizedBox.shrink(),
              articles.isNotEmpty ? const Carousel() : const SizedBox.shrink(),
              // videoUrls.isNotEmpty
              //     ? SectionText(
              //         text: AppStrings.videos,
              //         onSeeMorePressed: () {},
              //         displayTextButton: false,
              //       )
              //     : const SizedBox.shrink(), // Ajout de la section "Videos"
              // StatefulBuilder(builder: (context, state) {
              //   return SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       children: [
              //         for (var i = 0; i < _controllers.length; i++)
              //           Stack(
              //             children: [
              //               SizedBox(
              //                 height: 200,
              //                 width: 320,
              //                 child: Card(
              //                   clipBehavior: Clip.hardEdge,
              //                   elevation: 10,
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(20.0)),
              //                   child: AspectRatio(
              //                     aspectRatio: _controllers[i].value.aspectRatio,
              //                     child: FlickVideoPlayer(
              //                         flickManager: FlickManager(
              //                             videoPlayerController: _controllers[i])),
              //                   ),
              //                 ),
              //               ),
              //               GestureDetector(
              //                 onTap: () => _playPauseVideo(i),
              //                 child: Container(
              //                   color: Colors.transparent,
              //                   height: 200,
              //                   width: 320,
              //                 ),
              //               ),
              //             ],
              //           ),
              //       ],
              //     ),
              //   );
              // }),
              SectionText(
                text: AppStrings.recommendation,
                onSeeMorePressed: () {
                  const DiscoverPage();
                },
                displayTextButton: false,
              ),
              ListView.separated(
                primary: false,
                shrinkWrap: true,
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
