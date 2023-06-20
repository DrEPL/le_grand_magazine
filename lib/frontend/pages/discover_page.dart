import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/services/article_services.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import 'package:le_grand_magazine/frontend/pages/article_detail_page.dart';
import 'package:le_grand_magazine/frontend/utils/app_strings.dart';
import 'package:le_grand_magazine/frontend/widgets/category_chip.dart';
import 'package:le_grand_magazine/frontend/widgets/recommended_article.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

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
                  return CategoryChip(label: categories[index].displayName(), labelColor: Colors.white, backgroundColor: Colors.red);
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
                return RecommendedArticle(
                  title: articles[index].title,
                  category: articles[index].category.displayName(),
                  imageUrl: articles[index].image,
                  publicationDate: articles[index].publicationDate,
                  icon: articles[index].isSaved ? Icons.bookmark : Icons.bookmark_outline,
                  iconColor: articles[index].isSaved ? Colors.red : Colors.grey,
                  onIconPressed: () {},
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ArticleDetailPage(article: articles[index]))),
                );
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
