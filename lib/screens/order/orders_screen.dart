import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_playground/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/models/models.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      body: OrderList(),
    );
  }
}

