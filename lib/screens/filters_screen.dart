import 'package:flutter/material.dart';
// import 'package:mealapp/screens/tabs_screen.dart';

// import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filter { glutenFree, lactoseFree, vegan, vegeterian }

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _veganFilter = false;
  bool _vegetarianFilter = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFreeFilter = widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeFilter = widget.currentFilter[Filter.lactoseFree]!;
    _veganFilter = widget.currentFilter[Filter.vegan]!;
    _vegetarianFilter = widget.currentFilter[Filter.vegeterian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pop();
      //       Navigator.pushReplacement(context,
      //           MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //     } else {
      //       Navigator.of(context).pop();
      //     }
      //   },
      // ),
      // it works when i leave the page
      body: PopScope(
        canPop: false,
        onPopInvoked: (didpop) async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegan: _veganFilter,
            Filter.vegeterian: _vegetarianFilter,
          });
          // return false;
        },
        child: Column(
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
