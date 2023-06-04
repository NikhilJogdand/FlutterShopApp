import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text('Hello Friend'),
          automaticallyImplyLeading: false,
        ),
        const Divider(),
        ListTile(
          title: Text('Shop'),
          leading: const Icon(Icons.shop),
          onTap: () {
            Navigator.of(context).pushReplacementNamed("/");
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Orders'),
          leading: const Icon(Icons.payment),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          },
        )
      ],),
    );
  }
}
