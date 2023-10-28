// import 'package:e_commerce/consts/app_constant.dart';
// import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/widgets/product/heart_btn.dart';
import 'package:e_commerce/widgets/subtitle_text.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../providers/viewed_recently_provider.dart';
import '../../screens/inner_screen/product_details.dart';
// import '..\..\providers\cart_provider.dart';
// import '..\..\providers\product_provider.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.productId,
  });
  final productId;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    // final productModelProvider = Provider.of<ProductModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final getCurrentProduct = productProvider.findByProdId(widget.productId);
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    Size size = MediaQuery.of(context).size;
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(3.0),
            child: GestureDetector(
              onTap: () async {
                viewedProdProvider.addViewedProd(
                    productId: getCurrentProduct.productId);
                await Navigator.pushNamed(
                  context,
                  ProductDetailsScreen.routName,
                  arguments: getCurrentProduct.productId,
                );
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FancyShimmerImage(
                      imageUrl: getCurrentProduct.productImage,
                      width: double.infinity,
                      height: size.height * 0.22,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 5,
                        child: TitlesTextWidget(
                          label: getCurrentProduct.productTitle,
                          maxLines: 2,
                          fontSize: 18,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: HeartButtonWidget(
                            productId: getCurrentProduct.productId),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: SubtitleTextWidget(
                          label: '${getCurrentProduct.productPrice}\$',
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Flexible(
                          child: Material(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.lightBlue,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            if (cartProvider.isProdingCart(
                                productId: getCurrentProduct.productId)) {
                              return;
                            }
                            cartProvider.addProductToCart(
                                productId: getCurrentProduct.productId);
                          },
                          splashColor: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              cartProvider.isProdingCart(
                                      productId: getCurrentProduct.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          );
  }
}
