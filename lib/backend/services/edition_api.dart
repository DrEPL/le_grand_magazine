import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:le_grand_magazine/frontend/utils/api_link.dart';

Future getEditions() async {
  try {
    final response = await http.get(Uri.parse(editionsLink));
    if (response.statusCode == 200) {
      final editionsJson = jsonDecode(utf8.decode(response.bodyBytes));
      return editionsJson;
    }
  } catch (e) {
    debugPrint('Erreur: $e');
  }
}