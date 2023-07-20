

import 'dart:convert';

import 'package:le_grand_magazine/backend/models/category.dart';

class Article {
  final String title;
  final String summary;
  final String source;
  final String image;
  final String content;
  final String? editor;
  final String section;
  final Category category;
  final DateTime publicationDate;
  final bool isBreakingNews;
  Article({
    required this.title,
    required this.summary,
    required this.source,
    required this.image,
    required this.content,
    this.editor,
    required this.section,
    required this.category,
    required this.publicationDate,
    required this.isBreakingNews,
  });

  Article copyWith({
    String? title,
    String? summary,
    String? source,
    String? image,
    String? content,
    String? editor,
    String? section,
    Category? category,
    DateTime? publicationDate,
    bool? isBreakingNews,
  }) {
    return Article(
      title: title ?? this.title,
      summary: summary ?? this.summary,
      source: source ?? this.source,
      image: image ?? this.image,
      content: content ?? this.content,
      editor: editor ?? this.editor,
      section: section ?? this.section,
      category: category ?? this.category,
      publicationDate: publicationDate ?? this.publicationDate,
      isBreakingNews: isBreakingNews ?? this.isBreakingNews,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'summary': summary,
      'source': source,
      'image': image,
      'content': content,
      'editor': editor,
      'section': section,
      'category': category.toMap(),
      'publicationDate': publicationDate.millisecondsSinceEpoch,
      'isBreakingNews': isBreakingNews,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] ?? '',
      summary: map['summary'] ?? '',
      source: map['source'] ?? '',
      image: map['image'] ?? '',
      content: map['content'] ?? '',
      editor: map['editor'],
      section: map['section'] ?? '',
      category: Category.fromMap(map['category']),
      publicationDate: DateTime.parse(map['publicationDate']),
      isBreakingNews: map['isBreakingNews'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) => Article.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Article(title: $title, summary: $summary, source: $source, image: $image, content: $content, editor: $editor, section: $section, category: $category, publicationDate: $publicationDate, isBreakingNews: $isBreakingNews)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Article &&
      other.title == title &&
      other.summary == summary &&
      other.source == source &&
      other.image == image &&
      other.content == content &&
      other.editor == editor &&
      other.section == section &&
      other.category == category &&
      other.publicationDate == publicationDate &&
      other.isBreakingNews == isBreakingNews;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      summary.hashCode ^
      source.hashCode ^
      image.hashCode ^
      content.hashCode ^
      editor.hashCode ^
      section.hashCode ^
      category.hashCode ^
      publicationDate.hashCode ^
      isBreakingNews.hashCode;
  }
}
