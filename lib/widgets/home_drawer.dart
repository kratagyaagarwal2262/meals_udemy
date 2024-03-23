import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/filters_screen.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(252, 126, 62, 3),
            ),
            child: menuDesign(),
          ),
          ListTile(
            title: menuItem(
              title: "Meals",
              icon: Icons.restaurant,
            ),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: menuItem(
              title: "Filters",
              icon: Icons.settings,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const FiltersScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget menuDesign() {
  return SizedBox(
    width: 200.sp,
    child: Row(
      children: [
        Icon(
          Icons.fastfood_sharp,
          color: const Color.fromARGB(239, 248, 188, 91),
          size: 35.sp,
        ),
        SizedBox(
          width: 17.sp,
        ),
        Text(
          "Cooking Up!",
          style: TextStyle(
            color: const Color.fromARGB(239, 248, 188, 91),
            fontSize: 21.sp,
          ),
        )
      ],
    ),
  );
}

Widget menuItem({required String title, required IconData icon}) {
  return Row(
    children: [
      Row(
        children: [
          Icon(
            icon,
            size: 25.sp,
          ),
          SizedBox(
            width: 12.sp,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 21.sp,
            ),
          )
        ],
      ),
    ],
  );
}
