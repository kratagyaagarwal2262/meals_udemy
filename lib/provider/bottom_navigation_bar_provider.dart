import 'package:flutter/material.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;
  final List<String> _currentScreenTitle = ["Categories", "Favourite"];

  int get currentIndex => _currentIndex;

  List<String> get title => _currentScreenTitle;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  String getTitle(int index) {
    return _currentScreenTitle[index];
  }
}
