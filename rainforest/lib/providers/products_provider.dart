import 'package:flutter/material.dart';

import '../models/product.dart';
import '../data/dummy_products.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [...DUMMY_PRODUCTS];
  // Return a copy of _items.
  List<Product> get items {
    return [..._items];
  }

  void _addProduct() {
    notifyListeners();
  }
}