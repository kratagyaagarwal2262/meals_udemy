import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/filter_provider.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FilterProvider watch = context.watch<FilterProvider>();
    FilterProvider read = context.read<FilterProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: const Text('Gluten-free'),
            subtitle: const Text('Only include gluten-free meals.'),
            value: watch.isGluten,
            onChanged: (_) => read.changeGlutenValue(),
          ),
          SwitchListTile(
            title: const Text('Lactose-free'),
            subtitle: const Text('Only include lactose-free meals.'),
            value: watch.isLactoseFree,
            onChanged: (_) => read.changeLactoseValue(),
          ),
          SwitchListTile(
            title: const Text('Vegetarian'),
            subtitle: const Text('Only include vegetarian meals.'),
            value: watch.isVegeratian,
            onChanged: (_) => read.changeVegeratianValue(),
          ),
          SwitchListTile(
            title: const Text('Vegan'),
            subtitle: const Text('Only include vegan meals.'),
            value: watch.isVegan,
            onChanged: (_) => read.changeVeganValue(),
          ),
        ],
      ),
    );
  }
}
