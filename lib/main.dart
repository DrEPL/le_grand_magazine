import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:le_grand_magazine/frontend/pages/home_page.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(primarySwatch: Colors.red, visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home:  const HomePage(),
    );
  }
}
