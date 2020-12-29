import 'package:flutter/material.dart';

import '../screens/recipe_screen.dart';


class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({this.title, this.color});

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return RecipeScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    // We use gesture detector when we want to allow certain portions
    // of the app to be clickable, double clickable and so on.
    return GestureDetector(
      onTap: () => _selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
            title,
            style: themeData.textTheme.title),
        decoration: BoxDecoration(
          // We use gradients when we want color gradients.
          // withOpacity helps set the transparency of the box.
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15), // Round the box borders.
        ),
      ),
    );
  }
}
