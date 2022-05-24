// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:flutter_playground/models/models.dart';

class Order {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  Order({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<Order> _orders = List.empty(growable: true);

  UnmodifiableListView<Order> get orders => UnmodifiableListView([..._orders]);

  void addOrder(List<CartItem> cartProducts, double total) {
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
