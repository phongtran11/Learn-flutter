import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screen.dart';

class ProductItem extends StatelessWidget {
  final Product item;

  const ProductItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => {},
          ),
          trailing: IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
        child: GestureDetector(
            onTap: () => {
                  Navigator.of(context)
                      .pushNamed(ProductDetailScreen.routeName, arguments: item)
                },
            child: Image.network(item.imageUrl, fit: BoxFit.cover)),
      ),
    );
  }
}
