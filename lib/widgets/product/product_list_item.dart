import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/providers/cart_provider.dart';
import 'package:shopy/providers/wishlist_provider.dart';

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
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () => toggleFavorite(),
                child: Container(
                  child: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.grey.shade500,
                  ),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.contain,
                ),
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
                color: Colors.grey.shade400,
              ),
              child: Text(
                '${product.id} colors',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade100,
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
