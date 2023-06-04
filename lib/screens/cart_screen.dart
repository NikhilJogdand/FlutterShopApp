import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/orders_provider.dart';

import '../widgets/cart_list_item.dart';

class CartScreen extends StatelessWidget {
  static String routeName = 'cart-screen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Chart')),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                Chip(
                  label: Text(
                      cart.getCartTotalAmount().toStringAsFixed(2),
                      style: const TextStyle(color: Colors.black),
                    ),
                  backgroundColor: Theme.of(context).accentColor,
                ),
                MaterialButton(
                  onPressed: () {
                    Provider.of<OrdersProvider>(context, listen: false).addItems(cart.chartItems.values.toList(), cart.getCartTotalAmount());
                    cart.clear();
                  },
                  child: const Text(
                    "ORDER NOW",
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (ctx, index) {
            var itemList = cart.chartItems.values.toList()[index];
            return CartListItem(
                id: itemList.id,
                productId: cart.chartItems.keys.toList()[index],
                title: itemList.title,
                price: itemList.price,
                qty: itemList.quantity);
          },
          itemCount: cart.chartItems.length,
        ))
      ]),
    );
  }
}
