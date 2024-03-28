import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/bottom_navigation_bar_provider.dart';
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
            child: menuDesign(context),
          ),
          ListTile(
            title: menuItem(
              title: "Meals",
              icon: Icons.restaurant,
            ),
            onTap: () {
              context.read<BottomNavigationBarProvider>().setCurrentIndex(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: menuItem(
              title: "Filters",
              icon: Icons.settings,
            ),
            onTap: () {
              Navigator.pop(context);
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

Widget menuDesign(BuildContext context) {
  return SizedBox(
    width: 200.sp,
    child: Row(
      children: [
        Icon(
          Icons.fastfood_sharp,
          color: Theme.of(context).colorScheme.secondary,
          size: 35.sp,
        ),
        SizedBox(
          width: 17.sp,
        ),
        Text(
          "Cooking Up!",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
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
