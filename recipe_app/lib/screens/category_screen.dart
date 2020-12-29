import 'package:flutter/material.dart';

// This screen displays the information pertaining to a single
// Category.
class CategoryScreen extends StatelessWidget {
  final String categoryID;
  final String categoryTitle;

  const CategoryScreen(
      this.categoryID,
      this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final recipeBody = Container(
      child: Center(
        child: const Text("Items listed under category"),
      ),
    );
    final appBar = AppBar(title: Text(categoryTitle),);
    return Scaffold(
      appBar: appBar,
      body: recipeBody,
    );
  }
}
