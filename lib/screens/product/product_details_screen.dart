// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/providers/export_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final productData = Provider.of<ProductProvider>(context);
    final product = productData.getProductById(productId);
    final cartData = Provider.of<CartProvider>(context, listen: false);

    TextTheme textTheme = Theme.of(context).textTheme;

    void handleAddToCart() {
      cartData.addToCart(product.id, product.price, product.title);
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: const Text(
              'Added to cart!',
            ),
            duration: const Duration(seconds: 1),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          product.title,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  right: 10.0,
                  child: GestureDetector(
                    onTap: () => productData.toggleFavorite(productId),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: Icon(
                        Icons.favorite,
                        color: product.isFavorite ? Colors.red : Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: textTheme.subtitle2,
                ),
                Text(
                  product.description,
                  style: textTheme.bodySmall,
                ),
                Text(
                  '\$ ${product.price}',
                  style: textTheme.caption,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Theme.of(context).accentColor),
                    onPressed: handleAddToCart,
                    child: const Text(
                      'Add to Bag',
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
