import 'package:flutter/material.dart';

import '../data/dummy_meals.dart';

// This screen displays all the meals pertaining to a single
// category.
class CategoryScreen extends StatelessWidget {
  static const String routeName = '/category-screen';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs['title'];
    final String categoryID = routeArgs['id'];
    print(categoryID);
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();
    final mealsBody = Container(
        child: ListView.builder(
      itemBuilder: (ctx, ii) {
        return Text(categoryMeals[ii].title);
      },
      itemCount: categoryMeals.length,
    ));
    final appBar = AppBar(
      title: Text(categoryTitle),
    );
    return Scaffold(
      appBar: appBar,
      body: mealsBody,
    );
  }
}
