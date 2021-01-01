import 'package:flutter/material.dart';

import './screens/products_overview_screen.dart';
import './screens/product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rainforest',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewScreen(),
      routes: {
        ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
        ProductScreen.routeName: (ctx) => ProductScreen(),
      },
    );
  }
}
