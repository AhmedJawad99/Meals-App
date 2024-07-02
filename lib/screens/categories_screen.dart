import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availabeMeals});
  final List<Meal> availabeMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
          childAspectRatio: 3 / 2),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            availabeMeals: availabeMeals,
          )
      ],
    );
  }
}
