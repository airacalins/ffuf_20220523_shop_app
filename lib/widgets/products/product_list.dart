import 'package:flutter/material.dart';
import 'package:flutter_playground/data/products_data.dart';
import 'package:flutter_playground/models/models.dart';
import 'package:flutter_playground/screens/screens.dart';
import 'package:flutter_playground/widgets/products/product_tile.dart';

class ProductList extends StatelessWidget {
  final List<Product> products = ProductsData().products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5 / 6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ProductTile(
        product: products[index],
        onTap: () => Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: products[index],
        ),
      ),
      itemCount: products.length,
    );
  }
}
