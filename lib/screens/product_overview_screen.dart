// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_playground/widgets/widgets.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ShopLeaf',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ProductList(),
      ),
    );
  }
}
