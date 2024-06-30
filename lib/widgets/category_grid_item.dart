import 'package:flutter/material.dart';
import '../models/category.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/meals_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key,
      required this.category,
      required this.onToggleFavorite,
      required this.availabeMeals});
  final Category category;
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availabeMeals;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final filteredMeal = availabeMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList(); // cuz it itrable i use tolist
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  title: category.title,
                  meals: filteredMeal,
                  onToggleFavorite: onToggleFavorite,
                )));
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            category.color.withOpacity(0.54),
            category.color.withOpacity(0.9),
          ])),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          )),
    );
  }
}
