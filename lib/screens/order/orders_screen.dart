import 'package:flutter/material.dart';
import 'package:flutter_playground/models/models.dart';

import 'package:flutter_playground/widgets/widgets.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Your Order'),
      ),
      body: orderData.orders.isEmpty
          ? Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Text(
                  'No Order Yet',
                  style: textTheme.headline3,
                ),
              ),
            )
          : const OrderList(),
    );
  }
}
