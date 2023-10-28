import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/viewed_recently_provider.dart';
import 'package:e_commerce/widgets/product/heart_btn.dart';
import 'package:e_commerce/widgets/subtitle_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../consts/app_constant.dart';
import '../../providers/wishlist_provider.dart';
import '../../screens/inner_screen/product_details.dart';

class LastArrivalProductWidget extends StatelessWidget {
  const LastArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productModel = Provider.of<ProductModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    // final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          viewedProdProvider.addViewedProd(productId: productModel.productId);
          await Navigator.pushNamed(
            context,
            ProductDetailsScreen.routName,
            arguments: productModel.productId,
          );
        },
        child: SizedBox(
          width: size.width * 0.45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    imageUrl: productModel.productImage,
                    height: size.height * 0.11,
                    width: size.width * 0.60,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      productModel.productTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          HeartButtonWidget(productId: productModel.productId),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              IconlyLight.heart,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (cartProvider.isProdingCart(
                                  productId: productModel.productId)) {
                                return;
                              }
                              cartProvider.addProductToCart(
                                  productId: productModel.productId);
                            },
                            icon: Icon(
                              cartProvider.isProdingCart(
                                      productId: productModel.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_rounded,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: SubtitleTextWidget(
                        label: '${productModel.productPrice}\$',
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
