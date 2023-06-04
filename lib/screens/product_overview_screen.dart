import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/product_grid.dart';
import '../providers/cart_provider.dart';
import '../widgets/badge.dart';

class ProductOverviewScreen extends StatefulWidget {
  static String routeName = '/products';

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavorite = false;

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop App'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.FAVORITE,
                child: Text('Only Fav'),
              ),
              const PopupMenuItem(
                value: FilterOptions.ALL,
                child: Text('Show All'),
              )
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.FAVORITE) {
                  _showFavorite = true;
                } else if (selectedValue == FilterOptions.ALL) {
                  _showFavorite = false;
                }
              });
            },
          ),
          Consumer<CartProvider>(
            builder: (ctx, cart, ch) => Badges(
                value: cartProvider.itemCount.toString(),
                color: Colors.pink,
                child: ch!
            ),
            child: IconButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(_showFavorite),
    );
  }
}

enum FilterOptions { FAVORITE, ALL }
