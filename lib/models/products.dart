import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_playground/data/products_data.dart';

import 'package:flutter_playground/models/models.dart';

class Products with ChangeNotifier {
  final List<Product> _products = ProductsData().products;

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);
  int get productsCount => _products.length;
  // void addProduct() {
  //   _products.add(value);
  //   notifyListeners();
  // }

  Product getProductById(String id) {
    return _products.firstWhere((p) => p.id == id);
  }

  void toggleFavorite(String id) {
    final product = getProductById(id);
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }
}