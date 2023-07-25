// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/video.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/backend/services/video_services.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
import 'package:le_grand_magazine/frontend/widgets/section_text.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:video_player/video_player.dart';

class ReportageVideoPage extends StatefulWidget {
  const ReportageVideoPage({super.key});

  @override
  State<ReportageVideoPage> createState() => _ReportageVideoPageState();
}

class _ReportageVideoPageState extends State<ReportageVideoPage> {
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

  // void _playPauseVideo(int index) {
  //   setState(() {
  //     for (var i = 0; i < _controllers.length; i++) {
  //       if (i != index) {
  //         _controllers[i].pause();
  //         _isPlaying[i] = false;
  //       }
  //     }

  //     if (_isPlaying[index]) {
  //       _controllers[index].pause();
  //     } else {
  //       _controllers[index].play();
  //     }
  //     _isPlaying[index] = !_isPlaying[index];
  //   });
  // }

  // void _resetVideoPlayers() {
  //   for (final controller in _controllers) {
  //     controller.dispose();
  //   }
  //   _controllers.clear();
  //   _isPlaying.clear();
  //   _initializeVideoPlayers();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.videos,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 40)),
                Text(AppStrings.allVideos,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.black)),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: _controllers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: SizedBox(
                        height: 200,
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: AspectRatio(
                            aspectRatio: _controllers[index].value.aspectRatio,
                            child: FlickVideoPlayer(
                                flickManager: FlickManager(
                                    videoPlayerController:
                                        _controllers[index])),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
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
