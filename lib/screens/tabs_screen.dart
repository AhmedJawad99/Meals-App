import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/meals_screen.dart';
import 'package:mealapp/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _setScreen(String identifier) {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    } else {
      Navigator.of(context).pop();
    }
  }

  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeal = [];
  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisiting = _favoriteMeal.contains(meal);
    log('x');

    if (isExisiting) {
      setState(() {
        _favoriteMeal.remove(meal);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Removed from favorite list'),
            duration: Duration(seconds: 2),
          ),
        );
      });
    } else {
      setState(() {
        _favoriteMeal.add(meal);
        ScaffoldMessenger.of(context)
            .clearSnackBars(); //to remove the last snckbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Added to favorite list'),
            duration: Duration(seconds: 2),
          ),
        );
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      setState(() {
        activePage = MealsScreen(
          meals: _favoriteMeal,
          onToggleFavorite: _toggleMealFavoriteStatus,
        );
        activePageTitle = 'Favorites';
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
