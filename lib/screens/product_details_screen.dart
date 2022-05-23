// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/models/models.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final productData = Provider.of<Products>(context);
    final product = Provider.of<Products>(context).getProductById(productId);

    TextTheme textTheme = Theme.of(context).textTheme;

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
                Container(
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
            padding: EdgeInsets.all(10.0),
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
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Theme.of(context).accentColor),
                    onPressed: () {},
                    child: Text(
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
