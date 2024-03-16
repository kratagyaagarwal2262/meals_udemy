import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepWidget extends StatelessWidget {
  final List<String> steps;
  final String heading;
  const StepWidget({super.key, required this.steps, required this.heading});

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
            itemCount: steps.length,
            itemBuilder: (ctx, i) {
              return Text(
                steps[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
