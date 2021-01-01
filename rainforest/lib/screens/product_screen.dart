import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainforest/providers/products_provider.dart';

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
    final passedProduct = ModalRoute.of(context).settings.arguments as Product;
    final provider = Provider.of<ProductsProvider>(context);
    final product = provider.getProduct(passedProduct.id);
    if (product == null) {
      return Text("Unable to find the product");
    }

    return Scaffold(
      appBar: _buildAppBar(context, product),
      body: _buildBody(context, product),
    );
  }
}
