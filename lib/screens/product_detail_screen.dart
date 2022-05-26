import 'package:app/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productItem = ModalRoute.of(context)!.settings.arguments as Product;
    final product =
        Provider.of<Products>(context, listen: false).findById(productItem.id);

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
    );
  }
}
