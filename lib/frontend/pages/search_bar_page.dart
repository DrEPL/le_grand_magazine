import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/article.dart';
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
  List<Article> filteredArticles = [];
  final gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 400,
      childAspectRatio: 3 / 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10);

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _showClearButton = false;

  void _clearText() {
    _searchController.clear();
    setState(() {
      _showClearButton = _searchController.text.isNotEmpty;
      // filteredArticles.clear();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_checkShowClearButton);
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _checkShowClearButton() {
    setState(() {
      _showClearButton = _searchController.text.isNotEmpty;
    final searchValue = _searchController.text.toLowerCase();
    filteredArticles = articles.where((article) {
      final title = article.title.toLowerCase();
      final searchWords = searchValue.split(' ');
      return searchWords.every((word) => title.contains(word));
    }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_checkShowClearButton);
    _searchFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          onChanged: (value) {},
          decoration: InputDecoration(
              hintText: "Rechercher...",
              contentPadding: const EdgeInsets.all(15),
              border: InputBorder.none,
              suffixIcon: _showClearButton
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: _clearText,
                    )
                  : null // Show nothing if the text field is empty
              ),
          autofocus: false,
          textInputAction: TextInputAction.search,
        ),
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: filteredArticles.isNotEmpty ?
          GridView.builder(
            gridDelegate: gridDelegate,
            itemCount: filteredArticles.isNotEmpty ? filteredArticles.length : articles.length,
            itemBuilder: (context, index) {
              final article = filteredArticles.isNotEmpty ? filteredArticles : articles;
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ArticleDetailPage(article: article[index]))),
                child: Stack(
                  children: [
                    buildImage(index, article),
                    buildCategory(index, context, article),
                    buildTimeAndTitle(context, index, article)
                  ],
                ),
              );
            },
          )
          : 
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/search_not_found.png', // Chemin vers votre fichier SVG
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.width*0.8,
                  ),
                  const Text(
                    'Aucun résultat trouvé',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
