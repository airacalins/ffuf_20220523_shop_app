import 'package:flutter/material.dart';
import 'package:flutter_playground/providers/cart_provider.dart';
import 'package:flutter_playground/widgets/export_widgets.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/models/export_models.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<CartProvider>(context).carts;

    return Container();
    // ListView.builder(
    //   itemCount: carts.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return
    //     CartItem(
    //       carts.keys.toList()[index],
    //       carts.values.toList()[index],
    //     );
    //   },
    // );
  }
}
