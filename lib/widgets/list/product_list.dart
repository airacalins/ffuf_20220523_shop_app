// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_playground/widgets/export_widgets.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/providers/export_provider.dart';

class ProductList extends StatelessWidget {
  final bool showFavoriteProducts;

  const ProductList(this.showFavoriteProducts);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
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
        return ProductItem(product);
      },
      itemCount: products.length,
    );
  }
}
