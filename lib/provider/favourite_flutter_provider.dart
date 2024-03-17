import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class FavouriteMealClass extends ChangeNotifier {
  final List<Meal> favouriteMeals = [];
  String toastMessage = "";

  List<Meal> get getMealsList {
    return favouriteMeals;
  }

  String get getToastMessage {
    return toastMessage;
  }

  void addMealToFavourite(Meal mealData) {
    if (favouriteMeals.contains(mealData)) {
      favouriteMeals.remove(mealData);
      toastMessage = "This Meal is Removed From Favourite";
      notifyListeners();
    } else {
      favouriteMeals.add(mealData);
      toastMessage = "This Meal is Added to Favourtie";
      notifyListeners();
    }
  }
}
