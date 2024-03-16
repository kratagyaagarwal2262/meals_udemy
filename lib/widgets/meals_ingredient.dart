import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IngredientWidget extends StatelessWidget {
  final List<String> ingredients;
  final String heading;
  const IngredientWidget(
      {super.key, required this.ingredients, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          heading,
          style: TextStyle(
            fontSize: 23.sp,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(239, 248, 188, 91),
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ingredients.length,
            itemBuilder: (ctx, i) {
              return Column(
                children: [
                  SizedBox(
                    height: 10.sp,
                  ),
                  Text(
                    " ${i + 1})  ${ingredients[i]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
