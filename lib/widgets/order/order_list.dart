import 'package:flutter/material.dart';
import 'package:flutter_playground/models/models.dart';
import 'package:provider/provider.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return ListView.builder(
      itemBuilder: (context, index) => OrderItem(orderData.orders[index]),
      itemCount: orderData.orders.length
    );
  }
// }

//     return GridView.builder(
//       padding: const EdgeInsets.all(10.0),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 5 / 6,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       itemBuilder: (context, index) {
//         final product = products[index];
//         return ProductTile(product);
//       },
//       itemCount: products.length,
//     );
//   }