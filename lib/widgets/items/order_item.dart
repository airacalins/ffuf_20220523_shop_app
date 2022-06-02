// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_playground/models/export_models.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final Order order;

  const OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool _expanded = false;

    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '\$ ${widget.order.amount}',
              style: textTheme.bodyLarge,
            ),
            subtitle: Text(
              DateFormat('dd-MM-yyyy hh:mm').format(widget.order.dateTime),
              style: textTheme.caption,
            ),
            trailing: IconButton(
              onPressed: () => setState(() => _expanded = !_expanded),
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            ),
          )
        ],
      ),
    );
  }
}
