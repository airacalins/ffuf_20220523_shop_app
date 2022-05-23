// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        accentColor: Colors.blueGrey,
      ),
      routes: {
        ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
      },
    );
  }
}
