import 'package:le_grand_magazine/frontend/enums/category.dart';

class Article {
  final String title, summary, source, image, content;
  final String? editor;
  final Category category;
  final DateTime publicationDate;
  final bool isSaved;

  Article({
    required this.title,
    required this.content,
    required this.summary,
    required this.category,
    required this.image,
    this.editor,
    required this.source,
    required this.publicationDate,
    required this.isSaved,
  });
}
