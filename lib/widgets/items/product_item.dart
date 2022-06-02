import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/models/export_models.dart';
import 'package:flutter_playground/providers/export_provider.dart';
import 'package:flutter_playground/screens/export_screens.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProvider>(context);

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
            backgroundColor: Theme.of(context).accentColor,
          ),
        );
    }

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(ProductDetailsScreen.routeName, arguments: product.id),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: GridTile(
          footer: Container(
            padding: const EdgeInsets.all(5),
            color: Theme.of(context).primaryColor.withOpacity(0.9),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "\$ ${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: handleAddToCart,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  splashRadius: 10.0,
                  icon: const Icon(Icons.favorite),
                  onPressed: () => Provider.of<ProductProvider>(context, listen: false).toggleFavorite(product.id),
                  color: product.isFavorite ? Colors.red : Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
