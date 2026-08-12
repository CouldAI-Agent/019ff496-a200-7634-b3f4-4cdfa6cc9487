import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final String weight;
  final double mrp;
  final double discountPrice;
  final String categoryId;
  final String imageUrl;
  final double rating;
  final bool inStock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.weight,
    required this.mrp,
    required this.discountPrice,
    required this.categoryId,
    required this.imageUrl,
    this.rating = 4.5,
    this.inStock = true,
  });

  double get discountPercentage => 
      ((mrp - discountPrice) / mrp * 100).roundToDouble();
}
