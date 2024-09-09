import 'package:flutter/material.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel productModel) {
    if (productExist(productModel)) {
      int index = _carts.indexWhere(
        (element) => element.productModel == productModel,
      );
      _carts[index].quantity = _carts[index].quantity + 1;
    } else {
      _carts.add(
        CartModel(productModel: productModel, quantity: 1),
      );
    }
    notifyListeners();
  }

  addQuantity(ProductModel product) {
    int index = _carts.indexWhere(
      (element) => element.productModel == product,
    );
    _carts[index].quantity = _carts[index].quantity + 1;
    notifyListeners();
  }

  reduceQuantity(ProductModel product) {
    int index = _carts.indexWhere(
      (element) => element.productModel == product,
    );
    _carts[index].quantity = _carts[index].quantity - 1;
    notifyListeners();
  }

  productExist(ProductModel productModel) {
    if (_carts.indexWhere((element) => element.productModel == productModel) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  totalCart() {
    double total = 0;
    for (var i = 0; i < _carts.length; i++) {
      total = total + _carts[i].quantity * _carts[i].productModel.price;
    }
    return total;
  }
}
