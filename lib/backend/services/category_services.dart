import 'package:flutter/material.dart';
import 'package:le_grand_magazine/backend/models/category.dart';
import 'category_api.dart';

class CategoryListProvider extends ChangeNotifier {
  List<Category> listOfCategory = [];

  void addCategory(Category category) {
    listOfCategory.add(category);
    notifyListeners();
  }

  bool areCategoriesEqual(
      List<Category> newCategories, List<Category> oldCategories) {
    if (newCategories.length != oldCategories.length) {
      return false;
    }

    for (int i = 0; i < newCategories.length; i++) {
      if (newCategories[i] != oldCategories[i]) {
        return false;
      }
    }

    return true; // Les listes sont égales
  }

  Future<bool> listCategories() async {
    List<Category> listOfNewCategory = [];
    
    // Pour effectuer le fetch des nouvelles catégories depuis l'API
    final newCategories = await getCategories();
    listOfNewCategory.clear();
    for (var category in newCategories) {
      listOfNewCategory.add(Category.fromMap(category));
    }

    // Pour vérifier si les nouvelles catégories sont différentes des catégories actuelles
    if (!areCategoriesEqual(listOfNewCategory, listOfCategory)) {
      // Mettre à jour seulement les catégories qui ont changé
      listOfCategory.clear();
      listOfCategory.addAll(listOfNewCategory);
      notifyListeners();
      return true; // Catégories mises à jour avec succès
    } else {
      return false; // Aucun changement dans les catégories
    }
  }
}
