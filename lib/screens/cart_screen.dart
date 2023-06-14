import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../providers/cart.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total', style: TextStyle(fontSize: 20)),
                const Spacer(),
                Chip(
                  label: Text(
                    '\$${cart.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                TextButton(
                  onPressed: () => {
                    Provider.of<Orders>(context, listen: false)
                        .addItem(cart.items.values.toList(), cart.totalAmount),
                    cart.clear()
                  },
                  child: const Text('ORDER NOW'),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (ctx, i) => CartItemWidget(
              id: cart.items.values.toList()[i].id,
              productId: cart.items.keys.toList()[i],
              title: cart.items.values.toList()[i].title,
              quantity: cart.items.values.toList()[i].quantity,
              price: cart.items.values.toList()[i].price,
            ),
            itemCount: cart.items.length,
          ),
        ),
      ]),
    );
  }
}
