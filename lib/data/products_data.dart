import 'dart:collection';

import 'package:flutter_playground/models/models.dart';

class ProductsData {
  final List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Green-leafed Orchid Plant on Pot',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'https://images.pexels.com/photos/1309769/pexels-photo-1309769.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ),
    Product(
      id: 'p2',
      title: 'Cactus On Pot',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl: 'https://images.pexels.com/photos/1856430/pexels-photo-1856430.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ),
    Product(
      id: 'p3',
      title: 'Green Leafed Plant',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl: 'https://images.pexels.com/photos/3126442/pexels-photo-3126442.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ),
    Product(
      id: 'p4',
      title: 'A Plant',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'https://images.pexels.com/photos/970089/pexels-photo-970089.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ),
  ];

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);
}
