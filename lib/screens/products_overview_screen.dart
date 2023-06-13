import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

enum FilterOption { favorite, all }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavouritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption value) => {
              setState(
                () => {
                  if (value == FilterOption.favorite)
                    {_showFavouritesOnly = true}
                  else
                    {_showFavouritesOnly = false}
                },
              )
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOption.favorite,
                child: Text('Only Favourites'),
              ),
              const PopupMenuItem(
                value: FilterOption.all,
                child: Text('All'),
              ),
            ],
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: ProductsGrid(
        isFav: _showFavouritesOnly,
      ),
    );
  }
}
