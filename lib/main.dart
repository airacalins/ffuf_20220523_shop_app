// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_playground/models/products.dart';
import 'package:flutter_playground/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductOverviewScreen(),
        theme: ThemeData(
          fontFamily: 'Poppins',
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff111d13),
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Color(0xff111d13),
          accentColor: Color(0xffe76f51),
        ),
        routes: {
          ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
        },
      ),
    );
  }
}
