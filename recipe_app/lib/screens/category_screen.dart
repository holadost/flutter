import 'package:flutter/material.dart';

// This screen displays the information pertaining to a single
// Category.
class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs['title'];
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
