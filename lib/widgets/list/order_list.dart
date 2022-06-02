import 'package:flutter/material.dart';
import 'package:flutter_playground/providers/export_provider.dart';
import 'package:flutter_playground/widgets/export_widgets.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/models/export_models.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context).orders;

    return ListView.builder(
      itemBuilder: (context, index) => OrderItem(orders[index]),
      itemCount: orders.length,
    );
  }
}
