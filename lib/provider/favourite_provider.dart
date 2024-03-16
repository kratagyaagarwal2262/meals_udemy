import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavouriteMealProvider extends StateNotifier<List<Meal>> {
  FavouriteMealProvider() : super([]);
}
