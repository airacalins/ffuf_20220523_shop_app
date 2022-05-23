// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_playground/models/models.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final Function onTap;

  ProductTile({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
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
                top: 5,
                right: 5,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
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
                        style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "\$ ${product.price.toStringAsFixed(2)}",
                        style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}