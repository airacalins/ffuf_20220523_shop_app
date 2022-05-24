// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_playground/models/models.dart';
import 'package:flutter_playground/screens/screens.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);

    void handleAddToCart() {
      cartData.addToCart(product.id, product.price, product.title);
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              'Added to cart!',
            ),
            duration: Duration(seconds: 1),
            backgroundColor: Theme.of(context).accentColor,
          ),
        );
    }

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(ProductDetailsScreen.routeName, arguments: product.id),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: GridTile(
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
                  icon: Icon(Icons.favorite),
                  onPressed: () => Provider.of<Products>(context, listen: false).toggleFavorite(product.id),
                  color: product.isFavorite ? Colors.red : Colors.grey,
                ),
              )
            ],
          ),
          footer: Container(
            padding: EdgeInsets.all(5),
            color: Theme.of(context).primaryColor.withOpacity(0.9),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "\$ ${product.price.toStringAsFixed(2)}",
                        style: TextStyle(
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
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
