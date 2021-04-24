import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  int _cartItemsQuantity = 0;

  int get getCartItemsCount => _cartItemsQuantity;

  void incrementItemsQuantity(int val) {
    _cartItemsQuantity += val;
    notifyListeners();
  }

  void decrementItemsQuantity(int val) {
    _cartItemsQuantity -= val;
    notifyListeners();
  }
}
