import 'package:e_commerce/models/wishlidt_model.dart';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, WishlistModel> _wishlistItem = {};
  Map<String, WishlistModel> get getWishlist {
    return _wishlistItem;
  }

  void addOrRemoveFromWishlist({required String productId}) {
    if (_wishlistItem.containsKey(productId)) {
      _wishlistItem.remove(productId);
    } else {
      _wishlistItem.putIfAbsent(
          productId,
          () => WishlistModel(
              wishlistId: const Uuid().v4(), productId: productId));
    }

    notifyListeners();
  }

  bool isProdingWishlist({required String productId}) {
    return _wishlistItem.containsKey(productId);
  }

  void clearLocalWishlist() {
    _wishlistItem.clear();
    notifyListeners();
  }
}
