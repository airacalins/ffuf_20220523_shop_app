import 'package:flutter/material.dart';
import 'package:flutter_playground/models/export_models.dart';

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = List.empty(growable: true);

  List<Order> get orders => [..._orders];

  void addOrder(List<Cart> cartProducts, double total) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
