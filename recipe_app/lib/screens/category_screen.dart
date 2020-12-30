import 'package:flutter/material.dart';

// This screen displays all the meals pertaining to a single
// category.
class CategoryScreen extends StatelessWidget {
  static const String routeName = '/category-screen';
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs['title'];
    final mealsBody = Container(
      child: ListView.builder(itemBuilder: (ctx, ii) {

      }, )
    );
    final appBar = AppBar(title: Text(categoryTitle),);
    return Scaffold(
      appBar: appBar,
      body: mealsBody,
    );
  }
}
