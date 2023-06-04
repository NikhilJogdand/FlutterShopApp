import 'package:flutter/cupertino.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get chartItems {
    return {..._cartItems};
  }

  int get itemCount {
    return _cartItems.length;
  }

  void addItems(String id, String title, double price) {
    if (_cartItems.containsKey(id)) {
      // update quantity
      _cartItems.update(
          id,
          (existingItem) => CartItem(existingItem.id, existingItem.title,
              existingItem.price, existingItem.quantity + 1));
    } else {
      // add quantity
      _cartItems.putIfAbsent(
          id, () => CartItem(id = DateTime.now().toString(), title, price, 1));
    }
    notifyListeners();
  }

  double getCartTotalAmount() {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += (value.price * value.quantity);
    });
    return total;
  }

  void removeItem(String id) {
    _cartItems.remove(id);
    notifyListeners();
  }

  void clear() {
    _cartItems.clear();
    notifyListeners();
  }
}
