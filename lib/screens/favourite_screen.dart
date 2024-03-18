import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals/screens/meals_list_screen.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_flutter_provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteMealClass watch = context.watch<FavouriteMealClass>();
    return Scaffold(
      body: watch.favouriteMeals.isEmpty
          ? emptyFavourtie()
          : mealCardList(meal: watch.favouriteMeals, context: context),
    );
  }
}

Widget emptyFavourtie() {
  return Center(
    child: Column(
      children: [
        Text(
          "Oh oh.... nothing here!!!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21.sp,
            color: Colors.white,
          ),
        ),
        Text(
          "Try selecting a different category!",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
