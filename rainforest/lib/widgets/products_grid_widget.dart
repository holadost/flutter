import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './product_grid_item.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  bool showFavoritesOnly = false;
  ProductsGrid(this.showFavoritesOnly);

  @override
  Widget build(BuildContext context) {
    final prodProvider = Provider.of<ProductsProvider>(context);
    final products = showFavoritesOnly
        ? prodProvider.getFavoriteProducts()
        : prodProvider.getAllProducts();
    print("Total number of products: ${products.length}");
    return GridView.builder(
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
          return ChangeNotifierProvider.value(
              value: products[ii],
              child: new ProductGridItemWidget());
        });
  }
}
