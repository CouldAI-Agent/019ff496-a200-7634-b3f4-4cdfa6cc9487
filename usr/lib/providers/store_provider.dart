import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../models/category.dart';

class StoreProvider with ChangeNotifier {
  List<Category> _categories = [
    Category(id: 'c1', name: 'Grocery', iconUrl: 'https://via.placeholder.com/150'),
    Category(id: 'c2', name: 'Vegetables', iconUrl: 'https://via.placeholder.com/150'),
    Category(id: 'c3', name: 'Dairy', iconUrl: 'https://via.placeholder.com/150'),
  ];

  List<Product> _products = [
    Product(
      id: 'p1',
      categoryId: 'c1',
      name: 'Aashirvaad Atta',
      description: 'Whole wheat atta',
      weight: '5 kg',
      mrp: 250.0,
      discountPrice: 230.0,
      imageUrl: 'https://via.placeholder.com/150',
      inStock: true,
      rating: 4.5,
    ),
    Product(
      id: 'p2',
      categoryId: 'c2',
      name: 'Fresh Onion',
      description: 'Red onions',
      weight: '1 kg',
      mrp: 40.0,
      discountPrice: 35.0,
      imageUrl: 'https://via.placeholder.com/150',
      inStock: true,
      rating: 4.2,
    ),
  ];

  Map<String, int> _cart = {};

  List<Category> get categories => _categories;
  List<Product> get products => _products;
  Map<String, int> get cart => _cart;

  void addToCart(String productId) {
    if (_cart.containsKey(productId)) {
      _cart[productId] = _cart[productId]! + 1;
    } else {
      _cart[productId] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (_cart.containsKey(productId)) {
      if (_cart[productId]! > 1) {
        _cart[productId] = _cart[productId]! - 1;
      } else {
        _cart.remove(productId);
      }
      notifyListeners();
    }
  }

  int get cartCount {
    int count = 0;
    _cart.forEach((key, value) {
      count += value;
    });
    return count;
  }
}
