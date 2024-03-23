import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_card.dart';
import 'package:provider/provider.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../provider/filter_provider.dart';
import 'favourite_screen.dart';
import 'meal_details_screen.dart';

class MealsListScreen extends StatelessWidget {

  final Category category;
  const MealsListScreen(
      {super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<FilterProvider>();
    List<Meal> selectedMeals = dummyMeals.where((meals) {
      if (watch.isGluten && !meals.isGlutenFree) {
        return false;
      }
      if (watch.isVegan && !meals.isVegan) {
        return false;
      }
      if (watch.isVegeratian && !meals.isVegetarian) {
        return false;
      }
      if (watch.isLactoseFree && !meals.isLactoseFree) {
        return false;
      }
      if (!meals.categories.contains(category.id)) {
        return false;
      }
      return true;
    }).toList();
    List<Meal> categoryMeals = dummyMeals.where((meals) {
      if (!meals.categories.contains(category.id)) {
        return false;
      }
      return true;
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: mealCardList(
        meals: watch.isFilterApplied ? selectedMeals : categoryMeals,
        context: context,
      ),
    );
  }
}

Widget mealCardList(
    {required List<Meal> meals, required BuildContext context}) {
  return SingleChildScrollView(
    child: meals.isEmpty
        ? emptyfavourite()
        : Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
                itemCount: meals.length,
              itemBuilder: (ctx, i) {
                  return mealDetailWidget(meals: meals[i], ctx: context);
                },
              ),
            ],
          ),
  );
}

Widget mealDetailWidget({required Meal meals, required BuildContext ctx}) {
  return GestureDetector(
    onTap: () => Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => MealDetailScreen(
          meals: meals,
        ),
      ),
    ),
    child: MealCard(
      meal: meals,
    ),
  );
}
