import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/backend/services/category_services.dart';
import 'package:le_grand_magazine/backend/services/edition_services.dart';
import 'package:le_grand_magazine/backend/services/video_services.dart';
import 'package:le_grand_magazine/frontend/pages/discover_page.dart';
import 'package:le_grand_magazine/frontend/pages/home_page.dart';
import 'package:le_grand_magazine/frontend/pages/editions_page.dart';
import 'package:le_grand_magazine/frontend/pages/search_bar_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'info_page.dart';
import 'reportage_video_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final screens = const [
    HomePage(),
    DiscoverPage(),
    SavedArticlePage(),
    ReportageVideoPage(),
    InfoPage()
  ];
  int currentPage = 0;
  Timer? _timer;
  final Duration _refreshDuration = const Duration(
      seconds: 60); // Temps d'attente avant chaque rafraîchissement

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    final categoryProvider =
        Provider.of<CategoryListProvider>(context, listen: false);
    final articleProvider =
        Provider.of<ArticleListProvider>(context, listen: false);
    final editionProvider =
        Provider.of<EditionListProvider>(context, listen: false);
    final videoProvider =
        Provider.of<VideoListProvider>(context, listen: false);
    categoryProvider.listCategories();
    articleProvider.listArticles();
    videoProvider.listVideos();
    editionProvider.listEditions();
    // Mettre en place le rafraîchissement périodique
    _timer = Timer.periodic(_refreshDuration, (_) {
      categoryProvider.listCategories();
      articleProvider.listArticles();
      editionProvider.listEditions();
      videoProvider.listVideos();
      debugPrint("Fetch de l'api après $_refreshDuration seconde(s).");
    });
    requestPermission();
    super.initState();
  }

  requestPermission() async {
    // var status = await Permission.storage.status;
    // if (!status.isGranted) {
    //   await Permission.storage.request();
    // }
    // debugPrint(status.toString());
    try {
      var status = await Permission.storage.request();

      if (status.isGranted) {
        print('isGranted');
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    } catch (e) {
      print('~~error~~~>>>>>> $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 226, 00, 26),
          elevation: 0.5,
          title: Image.asset("assets/images/logo.png",
              width: screenSize.width * 0.25, height: screenSize.height * 0.25),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SearcheBarPage()));
                },
                icon: const Icon(Icons.search,
                    // color: Color.fromARGB(255, 112, 112, 112))),
                    color: Colors.white)),
            IconButton(
                onPressed: () {
                  Uri url = Uri.parse("https://www.legrandmagazine.cg");
                  launchUrl(url, mode: LaunchMode.externalApplication);
                },
                icon: Icon(MdiIcons.web, color: Colors.white))
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
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: ''),
            const BottomNavigationBarItem(
                icon: Icon(ModernPictograms.article_alt), label: ''),
            BottomNavigationBarItem(
                icon: Icon(MdiIcons.bookOpenPageVariantOutline), label: ''),
            const BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video_rounded), label: ''),
            BottomNavigationBarItem(
                icon: Icon(MdiIcons.informationVariant), label: ''),
          ],
        ),
      ),
    );
  }
}
