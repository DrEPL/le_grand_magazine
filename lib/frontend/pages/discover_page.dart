import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
import 'package:le_grand_magazine/frontend/widgets/category_chip.dart';
import '../widgets/SwitchCategory.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _currentCategoryIndex = 0;
  dynamic categorySelected = "Toutes";

  @override
  Widget build(BuildContext context) {
    const categories = Category.values;
    final articles = ArticleServices().articles;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.discover, style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 40)),
            Text(AppStrings.allNews, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, color: Colors.black)),
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
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return switchCategory(categorySelected, articles, index, context);
              },
              separatorBuilder: (context, _) => const SizedBox(height: 5),
              itemCount: articles.length,
            ),
          ],
        ),
      ),
    );
  }
}

