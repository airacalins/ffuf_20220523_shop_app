// // ignore_for_file: public_member_api_docs, sort_constructors_first, use_key_in_widget_constructors
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:flutter_playground/providers/export_provider.dart';

// class CartItem extends StatelessWidget {
//   final Cart cart;

//   const Cart(this.cart);

//   @override
//   Widget build(BuildContext context) {
//     final product = Provider.of<ProductProvider>(context).getProductById(productId);
//     final cartData = Provider.of<CartProvider>(context);
//     final textTheme = Theme.of(context).textTheme;

//     void deleteItem(String productId) {
//       cartData.removeItem(productId);
//       ScaffoldMessenger.of(context)
//         ..removeCurrentSnackBar()
//         ..showSnackBar(
//           SnackBar(
//             content: Text(
//               '${product.title} removed!',
//             ),
//             duration: Duration(seconds: 1),
//             backgroundColor: Theme.of(context).primaryColor,
//           ),
//         );
//     }

//     return Dismissible(
//       onDismissed: (direction) => deleteItem(product.id),
//       direction: DismissDirection.endToStart,
//       background: Container(
//         color: Colors.red,
//         // ignore: sort_child_properties_last
//         child: const Icon(
//           Icons.delete,
//           color: Colors.white,
//         ),
//         alignment: Alignment.centerRight,
//         padding: const EdgeInsets.only(right: 20),
//       ),
//       key: ValueKey(product.id),
//       child: Container(
//         margin: const EdgeInsets.only(top: 5.0),
//         child: ListTile(
//           leading: Container(
//             width: 48,
//             color: Colors.red,
//             child: Image.network(
//               product.imageUrl,
//               fit: BoxFit.cover,
//             ),
//           ),
//           title: Text(
//             cart.title,
//             style: textTheme.subtitle2,
//           ),
//           subtitle: Container(
//             padding: const EdgeInsets.only(top: 5.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '\$ ${cart.price}',
//                   style: textTheme.caption,
//                 ),
//                 Row(
//                   children: [
//                     cart.quantity != 1
//                         ? InkWell(
//                             onTap: () => cartData.decreaseQuantity(product.id),
//                             child: const Icon(
//                               Icons.remove,
//                               size: 12,
//                             ),
//                           )
//                         : Container(),
//                     Container(
//                       alignment: Alignment.center,
//                       width: 40,
//                       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                       margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                       color: Colors.grey.shade100,
//                       child: Text('${cart.quantity}'),
//                     ),
//                     InkWell(
//                       onTap: () => cartData.increaseQuantity(product.id),
//                       child: const Icon(
//                         Icons.add,
//                         size: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
