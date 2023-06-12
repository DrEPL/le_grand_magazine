import 'package:flutter/material.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //

            const Text("Le Grand Magazine", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

            const SizedBox(height: 30),

            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Text(
                  categories[index],
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                separatorBuilder: (BuildContext context, _) => const SizedBox(width: 8),
                itemCount: categories.length,
              ),
            ),

            const Text("Dernières nouvelles", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
            BottomNavigationBarItem(icon: Icon(Icons.home) ,label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
        ),
      ),
    );
  }
}
