import 'package:flutter/material.dart';
import 'package:flutter_book/models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items {
    return {..._items};
  }

  List<Cart> cartItems = [];
  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, Cart) {
      total += Cart.price * Cart.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title, String img) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCart) => Cart(
              id: existingCart.id,
              title: existingCart.title,
              price: existingCart.price,
              image: existingCart.image,
              quantity: existingCart.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              image: img,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
          productId,
          (existingCart) => Cart(
              id: existingCart.id,
              title: existingCart.title,
              quantity: existingCart.quantity - 1,
              price: existingCart.price));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
