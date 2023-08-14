// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/video.dart';
import 'package:le_grand_magazine/backend/services/video_services.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../themes/colors_theme.dart';
import '../utils/function.dart';
import '../widgets/category_chip.dart';

class ReportageVideoPage extends StatefulWidget {
  const ReportageVideoPage({super.key});

  @override
  State<ReportageVideoPage> createState() => _ReportageVideoPageState();
}

class _ReportageVideoPageState extends State<ReportageVideoPage> {
  List<Video> videoUrls = [];
  List<VideoPlayerController> _controllers = [];
  List<YoutubePlayerController> _controllersYoutube = [];
  List<bool> _isPlaying = [];
  Timer? _timer;
  final AutoScrollController _scrollController = AutoScrollController();
  final Duration _refreshDuration = const Duration(
      minutes: 5); // Temps d'attente avant chaque rafraîchissement
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
      if (!video.isLive) {
        final controller = VideoPlayerController.network(video.video_link);
        await controller.initialize();
        setState(() {
          _controllers.add(controller);
          // Défaut : la vidéo n'est pas en cours de lecture
          _isPlaying.add(false);
        });
      } else {
        String videoId;
        videoId = YoutubePlayer.convertUrlToId(video.video_link) ?? "";
        final youtubeController = YoutubePlayerController(
          initialVideoId: videoId, // ID de la vidéo YouTube
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        );
        setState(() {
          _controllersYoutube.add(youtubeController);
          // Défaut : la vidéo n'est pas en cours de lecture
          _isPlaying.add(false);
        });
      }
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
    for (final controller in _controllersYoutube) {
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
        RefreshIndicator(
          onRefresh: () async {
            VideoProvider(context);
            debugPrint("Tirer vers le bas");
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.videos,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 40,
                              fontFamily: 'DIN')),
                  Text(AppStrings.allVideos,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400, color: Colors.black)),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _controllersYoutube.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SizedBox(
                            height: 330,
                            child: Visibility(
                              visible: videoUrls[index].isLive,
                              child: Card(
                                clipBehavior: Clip.hardEdge,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: YoutubePlayer(
                                            controller:
                                                _controllersYoutube[index],
                                            showVideoProgressIndicator: true,
                                            progressIndicatorColor:
                                                ColorThemes.primarySwatch,
                                            liveUIColor:
                                                ColorThemes.primarySwatch,
                                          ),
                                        ),
                                        Positioned(
                                            top: 10,
                                            right: 10,
                                            child: CategoryChip(
                                              label: "Live",
                                              labelColor: Colors.white,
                                              backgroundColor:
                                                  ColorThemes.primarySwatch,
                                              onTap: () {},
                                            ))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Text(
                                              videoUrls[index].title,
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'DIN'),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50,
                                            child: SingleChildScrollView(
                                              child: Text(
                                                videoUrls[index].summary,
                                                textAlign: TextAlign.justify,
                                                softWrap: true,
                                                // maxLines: 8,
                                                // overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      _displayPublicationDate(
                                          videoUrls[index].created_at),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox.shrink();
                    },
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _controllers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: SizedBox(
                            height: 340,
                            child: Visibility(
                                visible: !videoUrls[index].isLive,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Column(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: _controllers[index]
                                            .value
                                            .aspectRatio,
                                        child: FlickVideoPlayer(
                                            flickManager: FlickManager(
                                                videoPlayerController:
                                                    _controllers[index])),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Text(
                                                videoUrls[index].title,
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'DIN'),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 50,
                                              child: SingleChildScrollView(
                                                child: Text(
                                                  videoUrls[index].summary,
                                                  textAlign: TextAlign.justify,
                                                  softWrap: true,
                                                  // maxLines: 8,
                                                  // overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        _displayPublicationDate(
                                            videoUrls[index].created_at),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                )),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: !_isAtTop,
          child: Positioned(
            bottom: 15.0,
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

  String _displayPublicationDate(DateTime publicationDate) {
    DateTime now = DateTime.now();
    if (publicationDate.day == now.day) {
      final difference = now.difference(publicationDate);
      if (difference.inSeconds < 60) {
        return "Il y'a ${difference.inSeconds} secondes";
      } else {
        if (difference.inMinutes < 60) {
          return "Il y'a ${difference.inMinutes} minutes";
        } else {
          if (difference.inHours == 1) {
            return "Il y'a ${difference.inHours} heure";
          } else {
            return "Il y'a ${difference.inHours} heures";
          }
        }
      }
    }

    // if (publicationDate.year != now.year) {
    //   return "L'an dernier";
    // }
    return "${publicationDate.day} ${monthInLetter(publicationDate.month)} ${publicationDate.year}";
  }

  String monthInLetter(int month) {
    switch (month) {
      case 1:
        return "Janvier";
      case 2:
        return "Février";
      case 3:
        return "Mars";
      case 4:
        return "Avril";
      case 5:
        return "Mai";
      case 6:
        return "Juin";
      case 7:
        return "Juillet";
      case 8:
        return "Août";
      case 9:
        return "Septembre";
      case 10:
        return "Octobre";
      case 11:
        return "Novembre";
      case 12:
        return "Décembre";
    }
    return "";
  }
}
