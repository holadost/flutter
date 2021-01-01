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
    final products = Provider.of<ProductsProvider>(context).items;
    final Product product = products.firstWhere((prd) {
      if (prd.id == passedProduct.id) {
        return true;
      }
      return false;
    });
    if (product == null) {
      print("Unable to find the given product");
      return Text("Unable to find the product");
    }

    return Scaffold(
      appBar: _buildAppBar(context, product),
      body: _buildBody(context, product),
    );
  }
}
