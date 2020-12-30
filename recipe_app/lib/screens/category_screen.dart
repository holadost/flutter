import 'package:flutter/material.dart';

import '../data/dummy_meals.dart';
import '../widgets/meal_item_widget.dart';

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
              return MealItemWidget(
                  id: categoryMeals[ii].id,
                  title: categoryMeals[ii].title,
                  duration: categoryMeals[ii].duration,
                  complexity: categoryMeals[ii].complexity,
                  affordability: categoryMeals[ii].affordability,
                  imageURL: categoryMeals[ii].imageUrl);
            },
            itemCount: categoryMeals.length));
    final appBar = AppBar(
      title: Text(categoryTitle),
    );

    return Scaffold(
      appBar: appBar,
      body: mealsBody,
    );
  }
}
