import 'package:flutter/material.dart';
import 'package:flutter_playground/models/export_models.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _carts = <String, Cart>{};
  Map<String, Cart> get carts => _carts;
  int get itemCount => _carts.length;

  double get totalAmount {
    var total = 0.0;
    _carts.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addToCart(String productId, double price, String title) {
    if (_carts.containsKey(productId)) {
      _carts.update(
        productId,
        (value) => Cart(
          id: value.id,
          title: value.title,
          quantity: value.quantity + 1,
          price: value.price,
        ),
      );
    } else {
      _carts.putIfAbsent(
        productId,
        () => Cart(
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
    if (_carts.containsKey(productId)) {
      _carts.update(
        productId,
        (value) => Cart(
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
    if (_carts.containsKey(productId)) {
      _carts.update(
        productId,
        (value) => Cart(
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
    _carts.remove(productId);
    notifyListeners();
  }

  void clear() {
    _carts = {};
    notifyListeners();
  }
}
