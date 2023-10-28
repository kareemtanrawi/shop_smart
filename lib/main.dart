import 'package:e_commerce/consts/theme_data.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/providers/theme_provider.dart';
import 'package:e_commerce/root_screen.dart';
import 'package:e_commerce/screens/auth/login.dart';
import 'package:e_commerce/screens/auth/register_screen.dart';
import 'package:e_commerce/screens/inner_screen/product_details.dart';
import 'package:e_commerce/screens/inner_screen/viewed_recently.dart';
import 'package:e_commerce/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/viewed_recently_provider.dart';
import 'providers/wishlist_provider.dart';
import 'screens/auth/forget_password.dart';
import 'screens/inner_screen/wishlist.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return ProductProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return CartProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return WishlistProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return ViewedProdProvider();
        }),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(
                isDarkTheme: themeProvider.getIsDarkTheme, context: context),
            home: const RootScreen(),
            routes: {
              RootScreen.routeName: (context) => const RootScreen(),
              ProductDetailsScreen.routName: (context) =>
                  const ProductDetailsScreen(),
              WishlistScreen.routName: (context) => const WishlistScreen(),
              ViewedRecentlyScreen.routName: (context) =>
                  const ViewedRecentlyScreen(),
              RegisterScreen.routName: (context) => const RegisterScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
              ForgotPasswordScreen.routeName: (context) =>
                  const ForgotPasswordScreen(),
              SearchScreen.routeName: (context) => const SearchScreen(),
            },
          );
        },
      ),
    );
  }
}
