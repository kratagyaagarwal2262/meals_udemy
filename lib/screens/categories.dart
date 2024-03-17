import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/categories_widget.dart';

import '../models/category.dart';
import 'meals_list_screen.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  void _selectCategory(BuildContext context, Category categoryData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsListScreen(
          meal: dummyMeals,
          category: categoryData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
        itemCount: availableCategories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 15.sp,
          crossAxisSpacing: 15.sp,
          childAspectRatio: 3 / 2,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return CategoryWidget(
            category: availableCategories[index],
            onTapped: () =>
                _selectCategory(context, availableCategories[index]),
          );
        },
      ),
      
    );
  }
}
