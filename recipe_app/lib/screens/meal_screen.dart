import 'package:flutter/material.dart';
import '../data/dummy_meals.dart';
import '../models/meal.dart';

// This screen displays the information pertaining to a single
// meal.
class MealScreen extends StatelessWidget {
  static const String routeName = "/meal-screen";

  Widget _buildMealListViews(BuildContext ctx, Meal meal, List<String> items) {
    final themeData = Theme.of(ctx);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: ListView.builder(
        itemBuilder: (ctx, ii) {
          return Card(
            color: themeData.accentColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(items[ii]),
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
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
      final appBar = AppBar(
        title: const Text('-----------------'),
      );
      return Scaffold(
        appBar: appBar,
        body: recipeBody,
      );
    }
    final meal = meals[0];
    final recipeBody = SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover)),
          _buildSectionTitle(context, "Ingredients"),
          _buildMealListViews(context, meal, meal.ingredients),
          _buildSectionTitle(context, "Steps"),
          _buildMealListViews(context, meal, meal.steps),
        ],
      ),
    );

    final appBar = AppBar(
      title: Text(meal.title),
    );
    return Scaffold(
      appBar: appBar,
      body: recipeBody,
    );
  }
}
