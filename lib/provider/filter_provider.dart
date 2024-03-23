import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  bool _isGluten = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;
  bool _isFilterApplied = false;

  get isGluten => _isGluten;

  get isVegeratian => _isVegetarian;

  get isVegan => _isVegan;

  get isLactoseFree => _isLactoseFree;

  get isFilterApplied => _isFilterApplied;

  void changeGlutenValue() {
    _isGluten = !_isGluten;
    changeFilterValue();
    notifyListeners();
  }

  void changeVegeratianValue() {
    _isVegetarian = !_isVegetarian;
    changeFilterValue();
    notifyListeners();
  }

  void changeVeganValue() {
    _isVegan = !_isVegan;
    changeFilterValue();
    notifyListeners();
  }

  void changeLactoseValue() {
    _isLactoseFree = !_isLactoseFree;
    changeFilterValue();
    notifyListeners();
  }

  void changeFilterValue() {
    if (isLactoseFree == true ||
        isGluten == true ||
        isVegan == true ||
        isVegeratian == true) {
      _isFilterApplied = true;
      notifyListeners();
    }
    if (isLactoseFree == false &&
        isGluten == false &&
        isVegan == false &&
        isVegeratian == false) {
      _isFilterApplied = false;
      notifyListeners();
    }
  }
}
