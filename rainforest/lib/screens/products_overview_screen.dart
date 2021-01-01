import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products_provider.dart';
import '../widgets/product_grid_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const String routeName = "/products-overview-screen";
  Widget _buildAppBar(BuildContext context) {
    final appBar = AppBar(
      title: Text('Rainforest'),
    );
    return appBar;
  }

  Widget _buildBody(BuildContext context) {
    final prodProvider = Provider.of<ProductsProvider>(context);
    final products = prodProvider.items;
    final body = GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, ii) {
          // We do this here so that if we change the isFave field for a
          // product(may be from outside the app), then the product grid
          // item must reflect the same.
          return ChangeNotifierProvider(
              create: (c) => products[ii],
              child: ProductGridItemWidget());
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
