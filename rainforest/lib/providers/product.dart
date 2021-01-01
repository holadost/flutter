import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String desc;
  final double price;
  final String imageURL;
  bool isFave;

  Product({
    @required this.id,
    @required this.title,
    @required this.desc,
    @required this.price,
    @required this.imageURL,
    this.isFave=false});

  void toggleFavorite() {
    isFave = !isFave;
    // This is similar to setState(). This will rebuild the widget.
    notifyListeners();
  }
}