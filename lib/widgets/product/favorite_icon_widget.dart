import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/providers/wishlist_provider.dart';

class FavoriteIconWidget extends ConsumerWidget {
  const FavoriteIconWidget({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, ref) {
    final wishlistNotifier = ref.watch(wishlistProvider.notifier);
    bool isFavorite = ref.watch(wishlistProvider).isFavorite(product);

    void toggleFavorite() {
      wishlistNotifier.toggle(product);
    }

    return InkWell(
      onTap: () => toggleFavorite(),
      child: Container(
        child: Icon(
          Icons.favorite,
          color: isFavorite ? Colors.red : kTextColorMedium,
        ),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey.shade100,
        ),
      ),
    );
  }
}
