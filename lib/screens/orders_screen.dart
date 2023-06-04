import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../providers/orders_provider.dart';
import '../widgets/orders_list_tile.dart';

class OrdersScreen extends StatelessWidget {
  static String routeName = 'Orders-screen';

  @override
  Widget build(BuildContext context) {
    OrdersProvider orderProvider = Provider.of<OrdersProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: orderProvider.orderedItems.isEmpty
          ? const Center(
              child: Text('No orders found!'),
            )
          : ListView.builder(
              itemCount: orderProvider.orderedItems.length,
              itemBuilder: (ctx, index) =>
                  OrdersListTile(orderProvider.orderedItems[index])),
    );
  }
}
