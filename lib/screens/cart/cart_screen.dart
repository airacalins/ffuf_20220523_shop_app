import 'package:flutter/material.dart';
import 'package:flutter_playground/widgets/export_widgets.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/providers/export_provider.dart';
import 'package:flutter_playground/screens/order/orders_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProvider>(context);
    final carts = cartData.carts;
    final orderData = Provider.of<OrderProvider>(context);
    final textTheme = Theme.of(context).textTheme;

    void handleCheckout() {
      orderData.addOrder(
        carts.values.toList(),
        cartData.totalAmount,
      );
      cartData.clear();

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: const Text(
              'Checkout Success!',
            ),
            duration: const Duration(seconds: 1),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        );
      Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: carts.isEmpty
                ? SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        'Empty Cart',
                        style: textTheme.headline3,
                      ),
                    ),
                  )
                : CartList(),
          ),
          Column(
            children: [
              const Divider(),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${cartData.itemCount} ${cartData.itemCount <= 1 ? 'item' : 'items'}',
                      style: textTheme.caption,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            'Total',
                            style: textTheme.caption,
                          ),
                        ),
                        Text(
                          '\$ ${cartData.totalAmount.toStringAsFixed(2)}',
                          style: textTheme.labelLarge,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).accentColor),
                  onPressed: handleCheckout,
                  child: const Text(
                    'Checkout',
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
