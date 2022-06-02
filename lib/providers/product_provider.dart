import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_playground/data/products_data.dart';

import 'package:flutter_playground/models/export_models.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = ProductsData().products;
  var showFavoriteProducts = false;

  List<Product> get products => [..._products];
  List<Product> get favoriteProducts => [..._products].where((p) => p.isFavorite).toList();
  int get productsCount => [..._products].length;

  Product getProductById(String id) {
    return [..._products].firstWhere((p) => p.id == id);
  }

  void toggleFavorite(String id) {
    final product = getProductById(id);
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }
}
