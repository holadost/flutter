import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/category_item.dart';

// This is the home page screen.
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text("My Recipes"));
    final homeBody = Container(
      child: GridView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          ...DUMMY_CATEGORIES.map((e) {
            return CategoryItem(title: e.title, color: e.color);
          }).toList()
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: homeBody,
    );
  }
}
