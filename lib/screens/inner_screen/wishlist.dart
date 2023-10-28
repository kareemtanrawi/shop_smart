import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce/screens/cart/cart_widget.dart';
import 'package:e_commerce/services/myapp_function.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/wishlist_provider.dart';
import '../../widgets/empty_bag.dart';
import '../../widgets/product/product_widget.dart';
// import 'bottom_checkout.dart';

class WishlistScreen extends StatelessWidget {
  static const routName = "/WishlistScreen";

  const WishlistScreen({super.key});

  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    final wishlistPeovider = Provider.of<WishlistProvider>(context);
    return wishlistPeovider.getWishlist.isEmpty
        ? const Scaffold(
            body: EmptyBagWidget(
              buttonText: 'Shop now',
              imagePath: 'assets/bag/bag_wish.png',
              subtitle:
                  'Look like your cart is empty, add something and make me happy',
              title: 'Nothing in ur wishlist yet ',
            ),
          )
        : Scaffold(
            // bottomSheet: const CartBottobSheetWidget(),
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/shopping_cart.png'),
              ),
              title: TitlesTextWidget(
                label: 'Wishlist (${wishlistPeovider.getWishlist.length})',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppFunction.showErrorOrWarningDialog(
                      isError: false,
                      context: context,
                      fct: () {
                        wishlistPeovider.clearLocalWishlist();
                      },
                      subtitle: '',
                    );
                  },
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                  ),
                ),
              ],
            ),
            body: DynamicHeightGridView(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              physics: const BouncingScrollPhysics(),
              builder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductWidget(
                    productId: wishlistPeovider.getWishlist.values
                        .toList()[index]
                        .productId,
                  ),
                );
              },
              itemCount: wishlistPeovider.getWishlist.length,
              crossAxisCount: 2,
            ),
          );
  }
}
