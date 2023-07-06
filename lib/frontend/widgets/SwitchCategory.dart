import 'package:flutter/material.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import 'package:le_grand_magazine/frontend/pages/article_detail_page.dart';
import 'package:le_grand_magazine/frontend/widgets/recommended_article.dart';
import '../../backend/models/article.dart';

switchCategory(catSelected, List<Article> articles, index, context) {
  switch (catSelected) {
    case "Toutes":
      return Padding(
        padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        child: RecommendedArticle(
          title: articles[index].title,
          category: articles[index].category.displayName(),
          imageUrl: articles[index].image,
          publicationDate: articles[index].publicationDate,
          icon:
              articles[index].isSaved ? Icons.bookmark : Icons.bookmark_outline,
          iconColor: articles[index].isSaved ? Colors.red : Colors.grey,
          onIconPressed: () {},
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ArticleDetailPage(article: articles[index]))),
        ),
      );
    case "Afrique":
      return articles[index].category.displayName() == "Afrique"
          ? Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: RecommendedArticle(
                title: articles[index].title,
                category: articles[index].category.displayName(),
                imageUrl: articles[index].image,
                publicationDate: articles[index].publicationDate,
                icon: articles[index].isSaved
                    ? Icons.bookmark
                    : Icons.bookmark_outline,
                iconColor: articles[index].isSaved ? Colors.red : Colors.grey,
                onIconPressed: () {},
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ArticleDetailPage(article: articles[index]))),
              ),
            )
          : const SizedBox();
    case "Politique":
      return articles[index].category.displayName() == "Politique"
          ? Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: RecommendedArticle(
                title: articles[index].title,
                category: articles[index].category.displayName(),
                imageUrl: articles[index].image,
                publicationDate: articles[index].publicationDate,
                icon: articles[index].isSaved
                    ? Icons.bookmark
                    : Icons.bookmark_outline,
                iconColor: articles[index].isSaved ? Colors.red : Colors.grey,
                onIconPressed: () {},
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ArticleDetailPage(article: articles[index]))),
              ),
            )
          : const SizedBox();
    case "Economie":
      return articles[index].category.displayName() == "Economie"
          ? Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: RecommendedArticle(
                title: articles[index].title,
                category: articles[index].category.displayName(),
                imageUrl: articles[index].image,
                publicationDate: articles[index].publicationDate,
                icon: articles[index].isSaved
                    ? Icons.bookmark
                    : Icons.bookmark_outline,
                iconColor: articles[index].isSaved ? Colors.red : Colors.grey,
                onIconPressed: () {},
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ArticleDetailPage(article: articles[index]))),
              ),
            )
          : const SizedBox();
    case "Societe":
      return articles[index].category.displayName() == "Societe"
          ? Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: RecommendedArticle(
                title: articles[index].title,
                category: articles[index].category.displayName(),
                imageUrl: articles[index].image,
                publicationDate: articles[index].publicationDate,
                icon: articles[index].isSaved
                    ? Icons.bookmark
                    : Icons.bookmark_outline,
                iconColor: articles[index].isSaved ? Colors.red : Colors.grey,
                onIconPressed: () {},
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ArticleDetailPage(article: articles[index]))),
              ),
            )
          : const SizedBox();
    case "Sport":
      return articles[index].category.displayName() == "Sport"
          ? Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: RecommendedArticle(
                title: articles[index].title,
                category: articles[index].category.displayName(),
                imageUrl: articles[index].image,
                publicationDate: articles[index].publicationDate,
                icon: articles[index].isSaved
                    ? Icons.bookmark
                    : Icons.bookmark_outline,
                iconColor: articles[index].isSaved ? Colors.red : Colors.grey,
                onIconPressed: () {},
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ArticleDetailPage(article: articles[index]))),
              ),
            )
          : const SizedBox();
    case "Culture":
      return articles[index].category.displayName() == "Culture"
          ? Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: RecommendedArticle(
                title: articles[index].title,
                category: articles[index].category.displayName(),
                imageUrl: articles[index].image,
                publicationDate: articles[index].publicationDate,
                icon: articles[index].isSaved
                    ? Icons.bookmark
                    : Icons.bookmark_outline,
                iconColor: articles[index].isSaved ? Colors.red : Colors.grey,
                onIconPressed: () {},
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ArticleDetailPage(article: articles[index]))),
              ),
            )
          : const SizedBox();
    case "Agenda":
      return articles[index].category.displayName() == "Agenda"
          ? Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: RecommendedArticle(
                title: articles[index].title,
                category: articles[index].category.displayName(),
                imageUrl: articles[index].image,
                publicationDate: articles[index].publicationDate,
                icon: articles[index].isSaved
                    ? Icons.bookmark
                    : Icons.bookmark_outline,
                iconColor: articles[index].isSaved ? Colors.red : Colors.grey,
                onIconPressed: () {},
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ArticleDetailPage(article: articles[index]))),
              ),
            )
          : const SizedBox();
    case "Science":
      return articles[index].category.displayName() == "Science"
          ? Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: RecommendedArticle(
                title: articles[index].title,
                category: articles[index].category.displayName(),
                imageUrl: articles[index].image,
                publicationDate: articles[index].publicationDate,
                icon: articles[index].isSaved
                    ? Icons.bookmark
                    : Icons.bookmark_outline,
                iconColor: articles[index].isSaved ? Colors.red : Colors.grey,
                onIconPressed: () {},
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ArticleDetailPage(article: articles[index]))),
              ),
            )
          : const SizedBox();
    default:
      const SizedBox();
  }
}
