
import 'package:flutter/material.dart';

import '../../backend/services/article_services.dart';
import '../enums/category.dart';
import '../utils/app_strings.dart';
import '../widgets/SwitchCategory.dart';
import '../widgets/category_chip.dart';

class SavedArticlePage extends StatefulWidget {
  const SavedArticlePage({super.key});

  @override
  State<SavedArticlePage> createState() => _SavedArticlePageState();
}

class _SavedArticlePageState extends State<SavedArticlePage> {
  int _currentCategoryIndex = 0;
  dynamic categorySelected = "Toutes";
  final categories = Category.values;
  final articles = ArticleServices().articles;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.saved, style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 40)),
            Text(AppStrings.savedDescription, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, color: Colors.black)),
                        SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryChip(
                    label: categories[index].displayName(),
                    labelColor: _currentCategoryIndex == index ? Colors.white : Colors.red,
                    backgroundColor: _currentCategoryIndex == index ?Colors.red : Colors.white,
                    onTap: () {
                      setState(() {
                        _currentCategoryIndex = index;
                        categorySelected = categories[index].displayName();
                      });
                    });
                },
                separatorBuilder: (context, _) {
                  return const SizedBox(width: 5);
                },
                itemCount: categories.length,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.62,
              child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return articles[index].isSaved ? 
                  switchCategory(categorySelected, articles, index, context) :
                  const SizedBox();
                },
                separatorBuilder: (context, _) => const SizedBox(height: 5),
                itemCount: articles.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

