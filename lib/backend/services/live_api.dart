import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:le_grand_magazine/frontend/utils/api_link.dart';

Future getLives() async {
  try {
    final response = await http.get(Uri.parse(livesLink));
    if (response.statusCode == 200) {
      final videosJson = jsonDecode(utf8.decode(response.bodyBytes));
      return videosJson;
    }
  } catch (e) {
    debugPrint('Erreur: $e');
  }
}

