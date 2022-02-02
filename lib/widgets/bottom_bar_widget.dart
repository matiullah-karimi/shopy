import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/model/app_tabs.dart';
import 'package:shopy/providers/app_tab_provider.dart';

class BottomBarWidget extends ConsumerWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    AppTabs currentTab = ref.watch(appTabProvider);

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
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
