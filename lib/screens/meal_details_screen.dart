import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../provider/favourite_flutter_provider.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meals;
  const MealDetailScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meals.title,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<FavouriteMealClass>().addMealToFavourite(meals);
              Fluttertoast.showToast(
                msg: context.read<FavouriteMealClass>().toastMessage,
              );
            },
            focusColor: Theme.of(context).colorScheme.secondary,
            color: Theme.of(context).colorScheme.secondary,
            icon: Icon(
              context.watch<FavouriteMealClass>().getMealsList.contains(meals)
                  ? Icons.star
                  : Icons.star_outline,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250.sp,
              child: Image.network(
                width: MediaQuery.of(context).size.width,
                meals.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            dataWidget(
              "Ingredients",
              meals.ingredients,
              context
            ),
            SizedBox(height: 20.sp),
            dataWidget(
              "Steps",
              meals.steps,
              context
            ),
            SizedBox(
              height: 30.sp,
            )
          ],
        ),
      ),
    );
  }
}

Widget dataWidget(String title, List<String> data , BuildContext ctx) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 21.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(ctx).colorScheme.secondary,
        ),
      ),
      SizedBox(
        height: 20.sp,
      ),
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (ctx, i) {
            return Text(
              data[i],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            );
          })
    ],
  );
}
