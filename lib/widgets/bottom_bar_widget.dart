import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/model/app_tabs.dart';
import 'package:shopy/providers/app_tab_provider.dart';
import 'package:shopy/providers/cart_provider.dart';

class BottomBarWidget extends ConsumerWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    AppTabs currentTab = ref.watch(appTabProvider);
    int totalQuantity = ref.watch(cartProvider).totalQuantity;

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          label: 'Cart',
          icon: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              const Icon(Icons.shopping_cart_outlined),
              Positioned(
                top: -8.0,
                right: -8.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: kTextColorDark,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Text(
                    '$totalQuantity',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: kTextColorLight,
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Wishlist',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
      currentIndex: currentTab.index,
      selectedItemColor: kBottomBarSelectedTabColor,
      unselectedItemColor: kBottomBarUnSelectedTabColor,
      onTap: (index) => ref.read(appTabProvider.notifier).changeTab(index),
    );
  }
}
