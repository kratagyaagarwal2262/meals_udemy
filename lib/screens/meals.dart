import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals/widgets/meals_step.dart';

import '../models/meal.dart';
import '../widgets/meals_ingredient.dart';

class MealsScreen extends StatelessWidget {
  final Meal mealsData;
  const MealsScreen({super.key, required this.mealsData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealsData.title),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              mealsData.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 300.sp,
            ),
            StepWidget(steps: mealsData.ingredients, heading: "Ingredients"),
            SizedBox(
              height: 50.sp,
            ),
            IngredientWidget(ingredients: mealsData.steps, heading: "Steps"),
          ],
        ),
      ),
    );
  }
}
