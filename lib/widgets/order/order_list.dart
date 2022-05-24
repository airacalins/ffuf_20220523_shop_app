import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/models/models.dart';
import 'package:flutter_playground/widgets/widgets.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return ListView.builder(
      itemBuilder: (context, index) => OrderItem(orderData.orders[index]),
      itemCount: orderData.orders.length,
    );
  }
}
