import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductGridItemWidget extends StatelessWidget {
  final Product product;

  ProductGridItemWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          product.imageURL,
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
          color: Theme.of(context).accentColor,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
          color: Theme.of(context).accentColor,
        ),
        backgroundColor: Colors.black87,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}