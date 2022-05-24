// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/screens.dart';
import 'package:flutter_playground/widgets/badge/badge.dart';
import 'package:flutter_playground/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';

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
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          'ShopLeaf',
        ),
        actions: [
          Consumer<Cart>(
            builder: (context, cartData, child) => Badge(
              value: cartData.itemCount.toString(),
              child: IconButton(
                onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName),
                icon: Icon(Icons.shopping_bag),
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
            icon: Icon(Icons.more_vert),
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
        child: ProductsGrid(_showFavoriteProducts),
      ),
    );
  }
}
