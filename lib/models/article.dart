import 'package:le_grand_magazine/enums/category.dart';

class Article {
  final String title, summary, subtitle, source, editor;
  final Category category;
  final DateTime publicationDate;
  final bool isSaved;

  Article({
    required this.title,
    required this.summary,
    required this.subtitle,
    required this.category,
    required this.editor,
    required this.source,
    required this.publicationDate,
    required this.isSaved,
  });
}
