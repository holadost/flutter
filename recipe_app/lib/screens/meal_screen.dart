import 'package:flutter/material.dart';
import 'package:recipe_app/data/dummy_meals.dart';

// This screen displays the information pertaining to a single
// meal.
class MealScreen extends StatelessWidget {
  static const String routeName = "/meal-screen";
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealID = routeArgs['id'];
    final meals = DUMMY_MEALS.where((meal) {
      if (meal.id == mealID) {
        return true;
      }
      return false;
    }).toList();
    if (meals.length == 0) {
      print("ERROR: Did not find meal with ID: $mealID");
      final recipeBody = Container(
        child: Center(
          child: const Text("Did not find this meal"),
        ),
      );
      final appBar = AppBar(title: const Text('-----------------'),);
      return Scaffold(
        appBar: appBar,
        body: recipeBody,
      );
    }
    final meal = meals[0];
    final recipeBody = Container(
      child: Center(
        child: Text(meal.title),
      ),
    );
    final appBar = AppBar(title: Text(meal.title),);
    return Scaffold(
      appBar: appBar,
      body: recipeBody,
    );
  }
}
