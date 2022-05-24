// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/models/models.dart';

class CartTile extends StatelessWidget {
  final String productId;
  final CartItem cartItem;

  const CartTile(this.productId, this.cartItem);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context).getProductById(productId);
    final cartData = Provider.of<Cart>(context);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        ListTile(
          leading: Container(
            color: Colors.red,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            cartItem.title,
            style: textTheme.subtitle2,
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${cartItem.price}',
                  style: textTheme.caption,
                ),
                Row(
                  children: [
                    cartItem.quantity != 1
                        ? InkWell(
                            onTap: () => cartData.decreaseQuantity(product.id),
                            child: const Icon(
                              Icons.remove,
                              size: 12,
                            ),
                          )
                        : Container(),
                    Container(
                      alignment: Alignment.center,
                      width: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      color: Colors.grey.shade100,
                      child: Text('${cartItem.quantity}'),
                    ),
                    InkWell(
                      onTap: () => cartData.increaseQuantity(product.id),
                      child: const Icon(
                        Icons.add,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
