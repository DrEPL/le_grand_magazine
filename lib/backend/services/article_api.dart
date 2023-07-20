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

// get() async {
//   try {
//     final articles = await fetchArticles();
//     print(articles);
//   } catch (error) {
//     print(error);
//   }
// }

// Future<List<dynamic>> fetchArticles() async {
//   final response =
//       await http.get(Uri.parse('http://192.168.100.93:8000/api/articles/'));

//   if (response.statusCode == 200) {
//     // Les données ont été récupérées avec succès
//     // Convertir la réponse en format JSON
//     final jsonData = json.decode(response.body);

//     // Traiter les données et les renvoyer
//     return jsonData;
//   } else {
//     // Gérer les erreurs de la requête
//     throw Exception('Erreur lors de la récupération des articles');
//   }
// }
