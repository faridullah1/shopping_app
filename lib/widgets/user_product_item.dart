import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../screens/edit_product_screen.dart';

class UserProductItemWidget extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;

  const UserProductItemWidget({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title),
      trailing: SizedBox(
        width: 100,
        child: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: id);
            },
            icon: const Icon(Icons.edit),
            color: Theme.of(context).colorScheme.primary,
          ),
          IconButton(
            onPressed: () async {
              try {
                await Provider.of<Products>(context, listen: false)
                    .deleteProduct(id);
              } catch (error) {
                scaffoldMessenger.hideCurrentSnackBar();

                var snakeBar = const SnackBar(
                    content: Text(
                  'Deleting failed!',
                  textAlign: TextAlign.center,
                ));

                scaffoldMessenger.showSnackBar(snakeBar);
              }
            },
            icon: const Icon(Icons.delete),
            color: Theme.of(context).colorScheme.error,
          ),
        ]),
      ),
    );
  }
}
