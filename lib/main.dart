import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:le_grand_magazine/pages/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.red, statusBarIconBrightness: Brightness.light));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Grand Magazine',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red), useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home:  const HomePage(),
    );
  }
}
