// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_playground/models/models.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$ ${order.amount}'),
            subtitle: Text(DateFormat('dd MM yyyy hh:mm').format(order.dateTime)),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.expand_more),
            ),
          )
        ],
      ),
    );
  }
}
