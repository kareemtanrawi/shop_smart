import 'package:e_commerce/models/viewed_product.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ViewedProdProvider with ChangeNotifier {
  final Map<String, ViewedModel> _viewedProdItems = {};

  Map<String, ViewedModel> get getViewedProds {
    return _viewedProdItems;
  }

  void addViewedProd({required String productId}) {
    _viewedProdItems.putIfAbsent(
      productId,
      () => ViewedModel(viewedId: const Uuid().v4(), productId: productId),
    );

    notifyListeners();
  }
}
