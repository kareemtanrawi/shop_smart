import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class HeartButtonWidget extends StatefulWidget {
  const HeartButtonWidget({
    super.key,
    this.bkgColor = Colors.transparent,
    this.size = 20,
    required this.productId,
    // this.isInWishlist = false,
  });

  final Color bkgColor;
  final double size;
  final String productId;
  // final bool? isInWishlist;

  @override
  State<HeartButtonWidget> createState() => _HeartButtonWidgetState();
}

class _HeartButtonWidgetState extends State<HeartButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: widget.bkgColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          wishlistProvider.addOrRemoveFromWishlist(productId: widget.productId);
        },
        icon: Icon(
          wishlistProvider.isProdingWishlist(productId: widget.productId)
              ? IconlyBold.heart
              : IconlyLight.heart,
          size: widget.size,
          color: wishlistProvider.isProdingWishlist(productId: widget.productId)
              ? Colors.red
              : Colors.grey,
        ),
      ),
    );
  }
}
