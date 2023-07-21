import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const VideoApp());

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  List<VideoPlayerController> _controllers = [];
  List<bool> _isPlaying = [];

  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    // Ajoutez d'autres liens de vidéos ici
  ];

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayers();
  }

  void _initializeVideoPlayers() async {
    for (final url in videoUrls) {
      final controller = VideoPlayerController.network(url);
      await controller.initialize();
      setState(() {
        _controllers.add(controller);
        _isPlaying.add(true); // Défaut : la vidéo n'est pas en cours de lecture
      });
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _togglePlayPause(int index) {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Liste de vidéos'),
        ),
        body: 
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i = 0; i < _controllers.length; i++)
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 320,
                      child: Card(
                        child: AspectRatio(
                          aspectRatio: _controllers[i].value.aspectRatio,
                          child: VideoPlayer(_controllers[i]),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _togglePlayPause(i),
                      child: Container(
                        color: Colors.transparent,
                        height: 200,
                        width: 320,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
