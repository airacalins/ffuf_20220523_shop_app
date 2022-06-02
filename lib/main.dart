// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_playground/providers/export_provider.dart';
import 'package:flutter_playground/screens/export_screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      fontFamily: 'Poppins',
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff111d13),
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color(0xff111d13),
      accentColor: Color(0xffe76f51),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductOverviewScreen(),
        theme: themeData,
        routes: {
          ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
        },
      ),
    );
  }
}
