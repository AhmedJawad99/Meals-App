import 'package:flutter/material.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';
import 'package:mealapp/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(
            meals: meals,
            onToggleFavorite: onToggleFavorite,
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(
              meals: meals,
              onToggleFavorite: onToggleFavorite,
            ),
          );
  }
}

class content extends StatelessWidget {
  const content({
    super.key,
    required this.meals,
    required this.onToggleFavorite,
  });

  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...meals
              .map((meal) => MealItem(
                    meal: meal,
                    onSelectedMeal: (Meal meal) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => MealDetailScreen(
                                meal: meal,
                                onToggleFavorite: onToggleFavorite,
                              )));
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }
}
