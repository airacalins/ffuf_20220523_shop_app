import 'package:flutter_playground/models/export_models.dart';

class Order {
  final String id;
  final double amount;
  final List<Cart> products;
  final DateTime dateTime;

  const Order({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}
