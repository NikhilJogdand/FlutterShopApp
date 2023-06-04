import 'package:flutter/material.dart';

import 'cart_item.dart';

class OrderedItems {
  final String id;
  final double amount;
  final List<CartItem> cartItems;
  final DateTime dateTime;

  OrderedItems(this.id, this.amount, this.cartItems, this.dateTime);
}