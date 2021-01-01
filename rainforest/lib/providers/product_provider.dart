import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [];
  // Return a copy of _items.
  List<Product> get items {
    return [..._items];
  }

  void _addProduct() {
    notifyListeners();
  }
}