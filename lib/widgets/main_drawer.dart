import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            ])),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    color: Theme.of(context).colorScheme.primary,
                    size: 48,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Cooking up...',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.of(context).pop();
              onSelectScreen('meals');
            },
            leading: const Icon(Icons.restaurant),
            iconColor: Theme.of(context).colorScheme.onSurface,
            title: Text(
              'Meal',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('filters');
            },
            leading: const Icon(Icons.settings),
            iconColor: Theme.of(context).colorScheme.onSurface,
            title: Text(
              'Filters',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
