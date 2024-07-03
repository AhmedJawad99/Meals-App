import 'package:flutter/material.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';
import 'package:mealapp/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? Content(
            meals: meals,
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: Content(
              meals: meals,
            ),
          );
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.meals,
  });

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...meals.map((meal) => MealItem(
                meal: meal,
                onSelectedMeal: (Meal meal) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => MealDetailScreen(
                            meal: meal,
                          )));
                },
              )),
        ],
      ),
    );
  }
}
