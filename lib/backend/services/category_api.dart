

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:le_grand_magazine/frontend/utils/api_link.dart';

Future getCategories() async {
  try {
    final response = await http.get(Uri.parse(categoriesLink));
    if (response.statusCode == 200) {
      final listCategory = jsonDecode(utf8.decode(response.bodyBytes));
      return listCategory;
    }
  } catch (e) {
    debugPrint('Erreur: $e');
  }
}