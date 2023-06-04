import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

import '../providers/product_provider.dart';
import '../widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  var _showFavorite = false;

  ProductGrid(this._showFavorite);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final List<Product> products = _showFavorite ? productData.favItems : productData.items;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          // create: (c) => products[index],
          value: products[index],
          child: ProductItem(),
        ),
      ),
    );
  }
}
