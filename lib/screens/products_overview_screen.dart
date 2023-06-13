import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/products_grid.dart';
import '../widgets/product_item.dart';
import '../models/products.dart';

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: ProductsGrid(),
    );
  }
}
