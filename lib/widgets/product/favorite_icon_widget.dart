import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/providers/auth_provider.dart';
import 'package:shopy/providers/wishlist_provider.dart';
import 'package:shopy/screens/login_screen.dart';
import 'package:shopy/utils/navigator.dart';

class FavoriteIconWidget extends ConsumerWidget {
  const FavoriteIconWidget({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, ref) {
    final wishlistNotifier = ref.watch(wishlistProvider.notifier);
    bool isFavorite = ref.watch(wishlistProvider).isFavorite(product);
    final authState = ref.watch(authStateProvider);

    void toggleFavorite() {
      if (!authState.authenticated) {
        return navigate(context, const LoginScreen());
      }

      wishlistNotifier.toggle(product);
    }

    return InkWell(
      onTap: () => toggleFavorite(),
      child: Container(
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_outline,
          color: kTextColorDark,
        ),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: kTextColorLight,
        ),
      ),
    );
  }
}
