import 'package:flutter/cupertino.dart';
import 'package:shopy/screens/cart_screen.dart';
import 'package:shopy/screens/home_screen.dart';
import 'package:shopy/screens/profile_screen.dart';
import 'package:shopy/screens/wishlist_screen.dart';

enum AppTabs { home, cart, wishlist, profile }

extension AppLangExtension on AppTabs {
  Widget get screen {
    switch (this) {
      case AppTabs.home:
        return const HomeScreen();
      case AppTabs.cart:
        return const CartScreen();
      case AppTabs.wishlist:
        return const WishlistScreen();
      default:
        return const ProfileScreen();
    }
  }
}
