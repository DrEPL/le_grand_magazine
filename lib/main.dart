import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/backend/services/category_services.dart';
import 'package:le_grand_magazine/backend/services/edition_services.dart';
import 'package:le_grand_magazine/backend/services/video_services.dart';
import 'package:le_grand_magazine/frontend/pages/main_page.dart';
import 'package:le_grand_magazine/frontend/themes/colors_theme.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ArticleListProvider()),
        ChangeNotifierProvider(create: (context) => CategoryListProvider()),
        ChangeNotifierProvider(create: (context) => EditionListProvider()),
        ChangeNotifierProvider(create: (context) => VideoListProvider()),
      ],
      child: ConnectivityAppWrapper(
        app: MaterialApp(
            title: AppStrings.appName,
            theme: ThemeData(
                fontFamily: 'EuclidCircular',
                primarySwatch: ColorThemes.primarySwatch,
                visualDensity: VisualDensity.adaptivePlatformDensity),
            debugShowCheckedModeBanner: false,
            home:
                // const MainPage(),
                SafeArea(
              child: AnimatedSplashScreen(
                duration: 1000,
                splash: Image.asset("assets/images/logo.png",
                    width: screenSize.width, height: screenSize.height),
                nextScreen: const MainPage(),
                splashTransition: SplashTransition.fadeTransition,
                pageTransitionType: PageTransitionType.fade,
                backgroundColor: ColorThemes.primarySwatch,
              ),
            )),
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const VideoPlayerExample(),
//     );
//   }
// }

// class VideoPlayerExample extends StatefulWidget {
//   const VideoPlayerExample({Key? key}) : super(key: key);

//   @override
//   State<VideoPlayerExample> createState() => _VideoPlayerExampleState();
// }

// class _VideoPlayerExampleState extends State<VideoPlayerExample> {
//   late VideoPlayerController controller;
//   String videoUrl =
//       'http://127.0.0.1:8000/media/videos/le_la_lui.mp4';

//   @override
//   void initState() {
//     super.initState();
//     controller = VideoPlayerController.network(videoUrl);

//     controller.addListener(() {
//       setState(() {});
//     });
//     // controller.setLooping(true);
//     controller.initialize().then((_) => setState(() {}));
//     controller.play();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: InkWell(
//           onTap: () {
//             // if (controller.value.isPlaying) {
//             //   controller.pause();
//             // } else {
//             //   controller.play();
//             // }
//           },
//           child: AspectRatio(
//             aspectRatio: controller.value.aspectRatio,
//             child: FlickVideoPlayer(
//                 flickManager: FlickManager(videoPlayerController: controller)),
//           ),
//         ),
//       ),
//     );
//   }
// }
