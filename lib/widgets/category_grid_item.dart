import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/screens/meals_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final filteredMeal = dummyMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList(); // cuz it itrable i use tolist
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  title: category.title,
                  meals: filteredMeal,
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
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )),
    );
  }
}
