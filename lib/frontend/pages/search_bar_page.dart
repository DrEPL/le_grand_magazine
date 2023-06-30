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
          child: GridView.builder(
            gridDelegate: gridDelegate,
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ArticleDetailPage(article: articles[index]))),
                child: Stack(
                  children: [
                    buildImage(index, articles),
                    buildCategory(index, context, articles),
                    buildTimeAndTitle(context, index, articles)
                  ],
                ),
              );
            },
          )),
    );
  }
}
