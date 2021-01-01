import 'package:flutter/material.dart';

import 'product.dart';
import '../data/dummy_products.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [...DUMMY_PRODUCTS];
  // Return a copy of _items.
  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
    notifyListeners();
  }

  Product getProduct(String prodID) {
    final Product product = items.firstWhere((prd) {
      if (prd.id == prodID) {
        return true;
      }
      return false;
    });
    if (product == null) {
      print("Unable to find the given product");
      return null;
    }
    return product;
  }
}