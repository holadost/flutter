import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = "/product-screen";

  Widget _buildAppBar(BuildContext context, Product product) {
    return AppBar(
      title: Text(
        product.title,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildBody(BuildContext context, Product product) {
    return Text(product.desc);
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
      appBar: _buildAppBar(context, product),
      body: _buildBody(context, product),
    );
  }
}
