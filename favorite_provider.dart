import 'package:flutter/material.dart';
import 'package:foodrecipe/data/data.dart';
import 'package:foodrecipe/models/meals_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Meal> _favMeals = [];
  List<Meal> get favMeals => _favMeals;
  Map<String, List<Meal>> mp = {};
  AddCategory(String s) {
    mp[s] = [];
    for (int i = 0; i < meals.length; i++) {
      for (int j = 0; j < meals[i].categoryIds.length; j++) {
        if (meals[i].categoryIds[j] == s) {
          mp[s]!.add(meals[i]);
        }
      }
    }
    notifyListeners();
  }
  addMeals(Meal meal) {
    if (_favMeals.contains(meal)) {
      _favMeals.remove(meal);
    } else {
      _favMeals.add(meal);
    }
    notifyListeners();
  }

  bool MealStatus(Meal color) => _favMeals.contains(color);
}
