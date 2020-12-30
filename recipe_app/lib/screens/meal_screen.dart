import 'package:flutter/material.dart';

// This screen displays the information pertaining to a single
// recipe.
class RecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeBody = Container(
      child: Center(
        child: const Text("New Recipe"),
      ),
    );
    final appBar = AppBar(title: const Text('This recipe'),);
    return Scaffold(
      appBar: appBar,
      body: recipeBody,
    );
  }
}
