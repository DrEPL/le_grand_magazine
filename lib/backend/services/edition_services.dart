import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/edition.dart';

import 'edition_api.dart';

class EditionListProvider extends ChangeNotifier {
  List<Edition> listOfEdition = [];

  void addEdition(Edition edition) {
    listOfEdition.add(edition);
    notifyListeners();
  }

  bool areEditionsEqual(List<Edition> newEditions, List<Edition> oldEditions) {
    if (newEditions.length != oldEditions.length) {
      return false;
    }

    for (int i = 0; i < newEditions.length; i++) {
      if (newEditions[i] != oldEditions[i]) {
        return false;
      }
    }

    return true; // Les listes sont égales
  }

  listEditions() async {
    List<Edition> listOfNewEditions = [];
    // Pour effectuer le fetch des nouveaux editions depuis l'API
    List<dynamic> newEditions = await getEditions();
    
    //Pour convertir les données de la liste Map en liste des editions 
    listOfNewEditions = newEditions.map((edition) => Edition.fromMap(edition)).toList();
    listOfEdition.clear();

    // Pour vérifier si les nouveaux editions sont différentes des editions actuels
    if (!areEditionsEqual(listOfEdition, listOfNewEditions)) {
      // Mettre à jour seulement les éditions qui ont changé
      listOfEdition.clear();
      listOfEdition.addAll(listOfNewEditions);
      notifyListeners();
      return true; // Catégories mises à jour avec succès
    } else {
      return false; // Aucun changement dans les éditions
    }
  }

  Future<List<Edition>> listOfEditions() async {
    List<dynamic> editions = await getEditions();
    final listOfEditions = editions.map((edition) => Edition.fromMap(edition)).toList();
    return listOfEditions;
  }
}
