import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/order/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('ShopLeaf'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName),
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
          )
        ],
      ),
    );
  }
}
