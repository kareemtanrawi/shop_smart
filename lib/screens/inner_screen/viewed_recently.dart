import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_commerce/screens/cart/cart_widget.dart';
import 'package:e_commerce/services/myapp_function.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/viewed_recently_provider.dart';
import '../../widgets/empty_bag.dart';
import '../../widgets/product/product_widget.dart';
// import 'bottom_checkout.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const routName = "/ViewedRecentlyScreen";

  const ViewedRecentlyScreen({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    return viewedProdProvider.getViewedProds.isEmpty
        ? const Scaffold(
            body: EmptyBagWidget(
              buttonText: 'Shop now',
              imagePath: 'assets/bag/order.png',
              subtitle:
                  'Look like your cart is empty, add something and make me happy',
              title: 'No Viewed Product yet',
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
                label:
                    'Viewed Recently (${viewedProdProvider.getViewedProds.length})',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // MyAppFunction.showErrorOrWarningDialog(
                    // context: context,
                    // fct: () {
                    // viewedProdProvider
                    // },
                    // subtitle: subtitle,
                    // );
                  },
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
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
                    productId: viewedProdProvider.getViewedProds.values
                        .toList()[index]
                        .productId,
                  ),
                );
              },
              itemCount: viewedProdProvider.getViewedProds.length,
              crossAxisCount: 2,
            ),
          );
  }
}
