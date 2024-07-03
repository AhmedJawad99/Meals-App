import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/providers/nav_bar_provider.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/meals_screen.dart';
import 'package:mealapp/widgets/main_drawer.dart';
import '../models/meal.dart';
import '../providers/favorites_provider.dart';
import '../providers/filters_provider.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedPageIndex = ref.watch(navBarProvider);

    final List<Meal> availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(availabeMeals: availableMeals);
    var activePageTitle = 'Categories';
    if (selectedPageIndex == 1) {
      final List<Meal> favoriteMeal = ref.watch(favouriteMealsProvider);

      activePage = MealsScreen(
        meals: favoriteMeal,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: (String identifier) {
          Navigator.of(context).pop();
          if (identifier == 'filters') {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.read(navBarProvider.notifier).selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
