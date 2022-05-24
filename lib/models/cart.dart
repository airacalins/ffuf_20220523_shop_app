// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems = <String, CartItem>{};

  Map<String, CartItem> get cartItems => _cartItems;
  int get itemCount => _cartItems.length;
  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addToCart(String productId, double price, String title) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          quantity: value.quantity + 1,
          price: value.price,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  void decreaseQuantity(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          quantity: value.quantity - 1,
          price: value.price,
        ),
      );
    }
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          quantity: value.quantity + 1,
          price: value.price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}
