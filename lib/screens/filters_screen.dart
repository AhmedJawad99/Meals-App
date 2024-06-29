import 'package:flutter/material.dart';
import 'package:mealapp/screens/tabs_screen.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _veganFilter = false;
  bool _vegetarianFilter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          if (identifier == 'meals') {
            Navigator.of(context).pop();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (ctx) => const TabsScreen()));
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      body: Column(
        children: [
          customSwitch(
            context,
            'Gluten-free',
            'Only include gluten-free meals.',
            _glutenFreeFilter,
            (bool value) => setState(() => _glutenFreeFilter = value),
          ),
          customSwitch(
            context,
            'Lactose-free',
            'Only include lactose-free meals.',
            _lactoseFreeFilter,
            (bool value) => setState(() => _lactoseFreeFilter = value),
          ),
          customSwitch(
            context,
            'Vegan',
            'Only include vegan meals.',
            _veganFilter,
            (bool value) => setState(() => _veganFilter = value),
          ),
          customSwitch(
            context,
            'Vegetarian',
            'Only include vegetarian meals.',
            _vegetarianFilter,
            (bool value) => setState(() => _vegetarianFilter = value),
          ),
        ],
      ),
    );
  }

  SwitchListTile customSwitch(BuildContext context, String title,
      String subtitle, bool filter, Function(bool newValue) onChanged) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      activeColor: Theme.of(context).colorScheme.primary,
      value: filter,
      onChanged: onChanged,
    );
  }
}
