import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/product_grid_item.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  static const String routeName = "/products-overview-screen";

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    final prodProvider = Provider.of<ProductsProvider>(context);
    final appBar = AppBar(
      title: Text('Rainforest'),
      actions: [
        PopupMenuButton(
          onSelected: (FilterOptions sv) {
            setState(() {
              if (sv == FilterOptions.Favorites) {
                showFavoritesOnly = true;
              } else if (sv == FilterOptions.All) {
                showFavoritesOnly = false;
              }
            });
          },
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(
                child: Text('Favorites'), value: FilterOptions.Favorites),
            PopupMenuItem(child: Text('All'), value: FilterOptions.All),
          ],
        )
      ],
    );
    final products = showFavoritesOnly
        ? prodProvider.getFavoriteProducts()
        : prodProvider.getAllProducts();
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
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
