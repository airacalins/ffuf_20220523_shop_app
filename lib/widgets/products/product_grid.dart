// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/data/products_data.dart';
import 'package:flutter_playground/models/models.dart';
import 'package:flutter_playground/screens/screens.dart';
import 'package:flutter_playground/widgets/widgets.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoriteProducts;
  ProductsGrid(this.showFavoriteProducts);

  final List<Product> products = ProductsData().products;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = showFavoriteProducts ? productData.favoriteProducts : productData.products;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5 / 6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductTile(product);
      },
      itemCount: products.length,
    );
  }
}
