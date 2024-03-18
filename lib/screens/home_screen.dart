import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bottom_navigation_bar_provider.dart';
import 'categories.dart';
import 'favourite_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Widget> _screens = [const Categories(), const FavouriteScreen()];

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarProvider watch =
        context.watch<BottomNavigationBarProvider>();
    BottomNavigationBarProvider read =
        context.read<BottomNavigationBarProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          watch.getTitle(watch.currentIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: watch.currentIndex,
        onTap: (index) {
          read.setCurrentIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
      body: _screens[watch.currentIndex],
    );
  }
}
