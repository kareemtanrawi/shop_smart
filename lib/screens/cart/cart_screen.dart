import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/screens/cart/cart_widget.dart';
import 'package:e_commerce/services/myapp_function.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/empty_bag.dart';
import 'bottom_checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartitems.isEmpty
        ? const Scaffold(
            body: EmptyBagWidget(
              buttonText: 'Shop now',
              imagePath: 'assets/bag/shopping_basket.png',
              subtitle:
                  'Look like your cart is empty, add something and make me happy',
              title: 'Your Cart is empty',
            ),
          )
        : Scaffold(
            bottomSheet: const CartBottobSheetWidget(),
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/shopping_cart.png'),
              ),
              title: TitlesTextWidget(
                label: 'Cart (${cartProvider.getCartitems.length})',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppFunction.showErrorOrWarningDialog(
                      isError: false,
                      context: context,
                      fct: () {
                        cartProvider.clearLocalCard();
                      },
                      subtitle: "Clear cart",
                    );
                  },
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.getCartitems.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                          value:
                              cartProvider.getCartitems.values.toList()[index],
                          child: const CartWidget());
                    },
                  ),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight + 10,
                ),
              ],
            ),
          );
  }
}
