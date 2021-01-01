import 'package:flutter/material.dart';

import '../data/dummy_products.dart';
import '../widgets/product_grid_item.dart';


class ProductsOverviewScreen extends StatelessWidget {
  static const String routeName = "/products-overview-screen";
  final products = DUMMY_PRODUCTS;

  Widget _buildAppBar(BuildContext context) {
    final appBar = AppBar(
      title: Text('Rainforest'),
    );
    return appBar;
  }

  Widget _buildBody(BuildContext context) {
    final body = GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, ii) {
          return ProductGridItemWidget(products[ii]);
        });
    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }
}
