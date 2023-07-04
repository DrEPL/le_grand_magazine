import 'package:flutter/material.dart';
import 'package:le_grand_magazine/frontend/pages/discover_page.dart';
import 'package:le_grand_magazine/frontend/pages/home_page.dart';
import 'package:le_grand_magazine/frontend/pages/saved_article_page.dart';
import 'package:le_grand_magazine/frontend/pages/search_bar_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final screens = const [HomePage(), DiscoverPage(), SavedArticlePage()];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Image.asset("assets/images/logo.png", width: screenSize.width*0.25, height: screenSize.height*0.25),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SearcheBarPage()));
            }, icon: const Icon(Icons.search, color: Color.fromARGB(255, 112, 112, 112))),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined, color: Color.fromARGB(255, 112, 112, 112)))
          ],
        ),
        body: screens[currentPage],
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
          ],
        ),
      ),
    );
  }
}
