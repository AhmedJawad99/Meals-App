import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);
  bool toggleMealFavoriteStatus(Meal meal) {
    final isExisiting = state.contains(meal);
    if (isExisiting) {
      //state.remove(meal); you can not remove in this way!
      state =
          state.where((elemnt) => elemnt.id != meal.id).toList(); // use this
      return false;
    } else {
      //state.add(meal);
      state = [...state, meal]; // [...[1,2,3], 4]
      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
