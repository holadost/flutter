import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/products_grid_widget.dart';

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
    print("Building products overview screen");
    final prodProvider = Provider.of<ProductsProvider>(context);
    final products = showFavoritesOnly
        ? prodProvider.getFavoriteProducts()
        : prodProvider.getAllProducts();
    print("Total number of products: ${products.length}");
    print("Show favorites: ${showFavoritesOnly}");
    var appBar = AppBar(
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
    return Scaffold(
      appBar: appBar,
      body: ProductsGrid(showFavoritesOnly),
    );
  }
}
