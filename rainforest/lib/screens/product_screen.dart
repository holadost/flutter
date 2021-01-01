import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = "/product-screen";

  final Product product;
  ProductScreen(this.product);

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        product.title,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Text(product.desc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }
}
