import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/widgets/subtitle_text.dart';
import 'package:e_commerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBottobSheetWidget extends StatelessWidget {
  const CartBottobSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: TitlesTextWidget(
                        label:
                            'Total (${cartProvider.getCartitems.length} product/${cartProvider.getQnt()} items )',
                      ),
                    ),
                    SubtitleTextWidget(
                      label:
                          "${cartProvider.getTotla(productProvider: productProvider).toStringAsFixed(2)}\$",
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('CheckOut'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
