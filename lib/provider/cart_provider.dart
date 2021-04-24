import 'package:flutter/cupertino.dart';

class CartData extends ChangeNotifier {
  int _cartItemsCount = 0;

  int getCartItemsCount() {
    return _cartItemsCount;
  }

  void incrementCartItemsCount(int val) {
    _cartItemsCount += val;
    notifyListeners();
  }

  void decrementCartItemsCount(int val) {
    _cartItemsCount -= val;
    notifyListeners();
  }
}
