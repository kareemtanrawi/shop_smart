import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartitems = {};
  Map<String, CartModel> get getCartitems {
    return _cartitems;
  }

  void addProductToCart({required String productId}) {
    _cartitems.putIfAbsent(
        productId,
        () => CartModel(
              cardId: const Uuid().v4(),
              productId: productId,
              Quntanty: 1,
            ));
    notifyListeners();
  }

  void updateQnt({required String productId, required int qty}) {
    _cartitems.update(
        productId,
        (cartItem) => CartModel(
              cardId: cartItem.cardId,
              productId: productId,
              Quntanty: qty,
            ));
    notifyListeners();
  }

  bool isProdingCart({required String productId}) {
    return _cartitems.containsKey(productId);
  }

  double getTotla({required ProductProvider productProvider}) {
    double total = 0.0;

    _cartitems.forEach((key, value) {
      final getCurrentProduct = productProvider.findByProdId(value.productId);
      if (getCurrentProduct == null) {
        total += 0;
      } else {
        total += double.parse(getCurrentProduct.productPrice) * value.Quntanty;
      }
    });
    return total;
  }

  int getQnt() {
    int total = 0;
    _cartitems.forEach((key, value) {
      total += value.Quntanty;
    });
    return total;
  }

  void clearLocalCard() {
    _cartitems.clear();
    notifyListeners();
  }

  void removeOneItem({required String productId}) {
    _cartitems.remove(productId);
    notifyListeners();
  }
}
