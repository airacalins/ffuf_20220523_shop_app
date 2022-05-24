import 'package:flutter/material.dart';

import 'package:flutter_playground/models/models.dart';
import 'package:flutter_playground/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);

    return ListView.builder(
      itemCount: cartData.itemCount,
      itemBuilder: (BuildContext context, int index) {
        return CartTile(
          cartData.cartItems.keys.toList()[index],
          cartData.cartItems.values.toList()[index],
        );
      },
    );
  }
}
