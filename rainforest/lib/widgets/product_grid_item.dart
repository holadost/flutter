import 'package:flutter/material.dart';

import '../models/product.dart';


class ProductGridItemWidget extends StatelessWidget {
  final Product product;

  ProductGridItemWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Image.network(product.imageURL));
  }
}
