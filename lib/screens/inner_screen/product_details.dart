// import 'package:e_commerce/consts/app_constant.dart';
import 'package:e_commerce/widgets/subtitle_text.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../providers/product_provider.dart';
import '../../widgets/app_name_text.dart';
import '../../widgets/product/heart_btn.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routName = "/ProductDetailsScreen";

  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    String? productId = ModalRoute.of(context)!.settings.arguments as String?;
    final getCurrentProduct = productProvider.findByProdId(productId!);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        title: const AppNameTextWidget(fontSize: 20),
      ),
      body: getCurrentProduct == null
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  FancyShimmerImage(
                    imageUrl: getCurrentProduct.productImage,
                    height: size.height * 0.38,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                getCurrentProduct.productTitle,
                                softWrap: true,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SubtitleTextWidget(
                              label: '${getCurrentProduct.productPrice}\$',
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeartButtonWidget(
                                bkgColor: Colors.blue.shade100,
                                productId: getCurrentProduct.productId,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: kBottomNavigationBarHeight - 10,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (cartProvider.isProdingCart(
                                          productId:
                                              getCurrentProduct.productId)) {
                                        return;
                                      }
                                      cartProvider.addProductToCart(
                                          productId:
                                              getCurrentProduct.productId);
                                    },
                                    icon: Icon(Icons.add_shopping_cart),
                                    label: Text(cartProvider.isProdingCart(
                                            productId:
                                                getCurrentProduct.productId)
                                        ? "In Cart"
                                        : 'Add a Cart'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TitlesTextWidget(
                              label: 'About This item',
                            ),
                            SubtitleTextWidget(
                                label:
                                    'In ${getCurrentProduct.productCategory}'),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SubtitleTextWidget(
                            label: getCurrentProduct.productDescription),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
