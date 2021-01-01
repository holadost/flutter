import 'package:flutter/foundation.dart';

class Product {
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
    this.isFave});
}