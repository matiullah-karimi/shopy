import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/providers/cart_provider.dart';
import 'package:shopy/providers/wishlist_provider.dart';
import 'package:shopy/widgets/product/favorite_icon_widget.dart';

class ProductListItem extends HookConsumerWidget {
  const ProductListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistNotifier = ref.watch(wishlistProvider.notifier);
    bool isFavorite = ref.watch(wishlistProvider).isFavorite(product);

    void toggleFavorite() {
      wishlistNotifier.toggle(product);
    }

    void addToCart() {
      ref.read(cartProvider.notifier).add(product);
    }

    return SizedBox(
      width: 100,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: FavoriteIconWidget(
                      isFavorite: isFavorite,
                      onTap: toggleFavorite,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.title.substring(0, 10),
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: kTextColorMedium,
              ),
              child: Text(
                '${product.id} colors',
                style: TextStyle(
                  fontSize: 12,
                  color: kTextColorLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                InkWell(
                  child: const Icon(Icons.add),
                  onTap: () => addToCart(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
