import 'package:flutter/material.dart';
import '../providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _items = [];

  List<OrderItem> get items {
    return [..._items];
  }

  void addItem(List<CartItem> products, double total) {
    _items.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: products,
        dateTime: DateTime.now(),
      ),
    );

    notifyListeners();
  }
}
