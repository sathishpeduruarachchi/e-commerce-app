import 'package:flutter/material.dart';

import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cartList = [];
  num _totalPrice = 0;

  addProduct(Product product) {
    _cartList.add(product);
    _totalPrice += product.price!;
    notifyListeners();
  }

  removeProduct(Product product) {
    _cartList.remove(product);
    _totalPrice -= product.price!;
    notifyListeners();
  }

  List<Product> get allProducts => _cartList;
  int get itemCount => _cartList.length;
  num get totalPrice => _totalPrice;
}
