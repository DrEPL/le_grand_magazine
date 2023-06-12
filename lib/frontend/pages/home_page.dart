import 'package:flutter/material.dart';
import 'package:le_grand_magazine/frontend/widgets/carousel.dart';
import 'package:le_grand_magazine/frontend/widgets/section_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ["Toutes", "Afrique", "Politique", "Economie", "Société", "Sport", "Culture", "Agenda", "Science"];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.black)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined, color: Colors.black))
          ],
        ),
        body: Column(
          children: [
            SectionText(text: "Breaking News", onSeeMorePressed: () {}),
            const Carousel(),
            SectionText(text: "Recommandation", onSeeMorePressed: () {}),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 25,
          currentIndex: currentPage,
          onTap: (index) => setState(() => currentPage = index),
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.language), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      ),
    );
  }
}
