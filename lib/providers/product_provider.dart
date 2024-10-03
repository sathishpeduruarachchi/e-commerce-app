import 'package:e_commerce_project/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  Product? _product;

  updateProduct({required Product product}) {
    _product = product;
    notifyListeners();
  }

  Product get product => _product!;
}
