import 'package:flutter/material.dart';

class CartModel with ChangeNotifier {
  final String cardId;
  final String productId;
  final int Quntanty;

  CartModel({
    required this.cardId,
    required this.productId,
    required this.Quntanty,
  });
}
