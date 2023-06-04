import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_item.dart';

import '../models/ordered_item.dart';

class OrdersProvider with ChangeNotifier {
  final List<OrderedItems> _orderItems = [];

  List<OrderedItems> get orderedItems {
    return [..._orderItems];
  }

  void addItems(List<CartItem> orderedCartItems, double total) {
    _orderItems.insert(0, OrderedItems(DateTime.now().toString(), total, orderedCartItems, DateTime.now()));
    notifyListeners();
  }

  void removeItems(String productId) {
    _orderItems.remove(productId);
    notifyListeners();
  }

  void clear() {
    _orderItems.clear();
    notifyListeners();
  }
}