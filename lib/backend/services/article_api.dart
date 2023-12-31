import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:le_grand_magazine/frontend/utils/api_link.dart';



Future getArticles() async {
  try {
    final response = await http.get(Uri.parse(articlesLink));
    if (response.statusCode == 200) {
      final articlesJson = jsonDecode(utf8.decode(response.bodyBytes));
      return articlesJson;
    }
  } catch (e) {
    debugPrint('Erreur: $e');
  }
}