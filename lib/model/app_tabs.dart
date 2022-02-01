import 'package:flutter/cupertino.dart';
import 'package:shopy/screens/cart_screen.dart';
import 'package:shopy/screens/home_screen.dart';
import 'package:shopy/screens/profile_screen.dart';

enum AppTabs { home, cart, profile }

extension AppLangExtension on AppTabs {
  Widget get screen {
    switch (this) {
      case AppTabs.home:
        return const HomeScreen();
      case AppTabs.cart:
        return const CartScreen();
      default:
        return const ProfileScreen();
    }
  }
}
