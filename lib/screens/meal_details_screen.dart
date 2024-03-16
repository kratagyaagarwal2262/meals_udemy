import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/meal.dart';

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
            dataWidget(
              "Ingredients",
              meals.ingredients,
            ),
            SizedBox(height: 20.sp),
            dataWidget(
              "Steps",
              meals.steps,
            )
          ],
        ),
      ),
    );
  }
}

Widget dataWidget(String title, List<String> data) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 21.sp,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(230, 255, 193, 7),
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
