import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/badge.dart';
import '../providers/products.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: GestureDetector(
        onTap: () => {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          )
        },
        child: GridTile(
          footer: GridTileBar(
            title: Text(product.title),
            backgroundColor: Colors.black54,
            leading: Consumer<Product>(
              builder: (ctx, product, child) => IconButton(
                color: Theme.of(context).accentColor,
                icon: Icon(product.isFavorite
                    ? Icons.favorite_outlined
                    : Icons.favorite_outline_sharp),
                onPressed: () {
                  product.toggleFavorite();
                },
              ),
            ),
            trailing: IconButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                cartProvider.addItems(product.id, product.title, product.price);
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
