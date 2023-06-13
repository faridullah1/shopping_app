import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product.dart';

import 'package:shopping_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          title: Text(product.title, textAlign: TextAlign.center),
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              product.isFavourite ? Icons.favorite : Icons.favorite_border,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () => {product.toggleFavouriteStatus()},
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () => {},
          ),
        ),
        child: GestureDetector(
          onTap: () => {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            ),
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
