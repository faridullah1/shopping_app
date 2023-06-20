import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/app_constants.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavourite = false,
  });

  Future<void> toggleFavouriteStatus() async {
    var oldFavourite = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();

    var url = Uri.parse('${AppConstants.baseUrl}/products/$id.json');
    try {
      await http
          .patch(url, body: jsonEncode({'isFavourite': isFavourite}))
          .then((resp) {
        if (resp.statusCode >= 400) {
          isFavourite = oldFavourite;
          notifyListeners();
        }
      });
    } catch (error) {
      isFavourite = oldFavourite;
      notifyListeners();
    }
  }
}
