// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_playground/providers/export_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/models/export_models.dart';
import 'package:flutter_playground/screens/export_screens.dart';
import 'package:flutter_playground/widgets/export_widgets.dart';

enum FilterOptions {
  All,
  Favorites,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavoriteProducts = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(
          'ShopLeaf',
        ),
        actions: [
          Consumer<Cart>(
            builder: (context, cartData, child) => Badge(
              value: cartData.toString(),
              child: IconButton(
                onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName),
                icon: const Icon(Icons.shopping_bag),
              ),
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              setState(() {
                if (value == FilterOptions.All) {
                  _showFavoriteProducts = false;
                } else {
                  _showFavoriteProducts = true;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: FilterOptions.All,
                child: Text(
                  'All',
                  style: textTheme.subtitle2,
                ),
              ),
              PopupMenuItem(
                value: FilterOptions.Favorites,
                child: Text(
                  'Favorites',
                  style: textTheme.subtitle2,
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ProductList(_showFavoriteProducts),
      ),
    );
  }
}
