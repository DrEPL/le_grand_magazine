
import 'package:flutter/material.dart';

import '../../backend/services/article_services.dart';
import '../widgets/components/buildCategory.dart';
import '../widgets/components/buildImage.dart';
import '../widgets/components/buildTimeAndTitle.dart';
import 'article_detail_page.dart';

class SearcheBarPage extends StatefulWidget {
  const SearcheBarPage({super.key});

  @override
  State<SearcheBarPage> createState() => _SearcheBarPageState();
}

class _SearcheBarPageState extends State<SearcheBarPage> {
  final articles = ArticleServices().articles;
  final gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10);

  final TextEditingController _searchController = TextEditingController();

  void clearText(){
    _searchController.clear();
    // setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(hintText: "Rechercher...",
          contentPadding: const EdgeInsets.all(15),
          border: InputBorder.none,
          suffixIcon: _searchController.text.isEmpty
              ? null // Show nothing if the text field is empty
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: clearText,
                ),
           ),
          autofocus: false,
          textInputAction: TextInputAction.search,
        ),
        backgroundColor: Colors.white,
        leading: const BackButton( color: Colors.black,),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: 
        GridView.builder(gridDelegate: gridDelegate,
            itemCount: articles.length,
            itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ArticleDetailPage(article: articles[index]))),
              child: Stack(
                children: [buildImage(index, articles), buildCategory(index, context, articles), buildTimeAndTitle(context, index, articles)],
              ),
            );
          },)
      ),
    );
  }
}