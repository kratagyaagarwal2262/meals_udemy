import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_card.dart';

import '../models/category.dart';
import 'meal_details_screen.dart';

class MealsListScreen extends StatelessWidget {
  final List<Meal> meal;
  final Category category;
  const MealsListScreen(
      {super.key, required this.meal, required this.category});

  void _showCategory(BuildContext context, Meal meals) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(
          meals: meals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: meal.length,
              itemBuilder: (ctx, i) {
                return meal[i].categories.contains(category.id)
                    ? GestureDetector(
                        onTap: () => _showCategory(
                          context,
                          meal[i],
                        ),
                        child: MealCard(
                          meal: meal[i],
                        ),
                      )
                    : const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
