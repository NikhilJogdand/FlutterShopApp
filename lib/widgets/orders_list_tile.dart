import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/ordered_item.dart' as ord;
import 'dart:math';

class OrdersListTile extends StatefulWidget {
  final ord.OrderedItems orderedItems;

  OrdersListTile(this.orderedItems);

  @override
  State<OrdersListTile> createState() => _OrdersListTileState();
}

class _OrdersListTileState extends State<OrdersListTile> {
  var _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(children: [
        ListTile(
          title: Text('\$${widget.orderedItems.amount.toStringAsFixed(2)}'),
          subtitle: Text(DateFormat('dd/MM/yyyy hh:mm aa')
              .format(widget.orderedItems.dateTime)),
          trailing: IconButton(
            icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            onPressed: null,
          ),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        if (_isExpanded)
          Container(
            margin: const EdgeInsets.all(15.0),
            height: min(widget.orderedItems.cartItems.length * 20.0 + 10, 140),
            child: ListView(
              children: widget.orderedItems.cartItems
                  .map((prdt) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(prdt.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          Text('${prdt.quantity} x \$${prdt.price}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),)
                        ],
                      ))
                  .toList(),
            ),
          )
      ]),
    );
  }
}
