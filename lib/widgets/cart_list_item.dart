import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartListItem extends StatelessWidget {
  String id;
  String productId;
  String title;
  double price;
  int qty;

  CartListItem(
      {super.key, required this.id,
      required this.productId,
      required this.title,
      required this.price,
      required this.qty});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        child: Container(
          alignment: Alignment.centerRight,
          color: Theme.of(context).errorColor,
          padding: const EdgeInsets.all(20),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      onDismissed: (direction) => {
        // print(productId),
        Provider.of<CartProvider>(context, listen: false).removeItem(productId)
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
                child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: FittedBox(child: Text('\$${price}')),
            )),
            title: Text(title),
            subtitle: Text('Total: \$${(price * qty)}'),
            trailing: Text('$qty X'),
          ),
        ),
      ),
    );
  }
}
