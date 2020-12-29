import 'package:flutter/material.dart';

// This screen displays the information pertaining to a single
// Category.
class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeBody = Container(
      child: Center(
        child: const Text("Items listed under category"),
      ),
    );
    final appBar = AppBar(title: const Text('This Category'),);
    return Scaffold(
      appBar: appBar,
      body: recipeBody,
    );
  }
}
