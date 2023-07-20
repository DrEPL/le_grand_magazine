import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/backend/services/category_services.dart';
import 'package:le_grand_magazine/frontend/pages/main_page.dart';
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
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
        // AnimatedSplashScreen(
        //   // duration: 3000,
        //   duration: 1000,
        //   splash: Image.asset("assets/images/logo.png", width: screenSize.width, height: screenSize.height),
        //   nextScreen: const MainPage(),
        //   splashTransition: SplashTransition.fadeTransition,
        //   pageTransitionType: PageTransitionType.fade,
        //   backgroundColor: const Color.fromARGB(255, 226, 00, 26)),
      ),
    );
  }
}
