import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';
import '../widgets/order_item.dart';
import '../widgets/drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = 'orders';

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderContainer = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItemWidget(
          order: orderContainer.items[i],
        ),
        itemCount: orderContainer.items.length,
      ),
    );
  }
}
