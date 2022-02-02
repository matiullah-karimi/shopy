import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/providers/wishlist_provider.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:shopy/widgets/button_widget.dart';
import 'package:shopy/widgets/product/products_list_widget.dart';

class WishlistScreen extends HookConsumerWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    List<Product> products = ref.watch(wishlistProvider).products;
    final wishlistNotifier = ref.watch(wishlistProvider.notifier);

    return Scaffold(
      appBar: const AppBarWidget(title: 'My wishlist'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () => wishlistNotifier.clear(),
                  child: const Text('Clear all'),
                )
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.blue.shade100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.blue.shade200),
                ),
              ),
            ),
            Expanded(child: ProductsListWidget(products: products)),
            if (products.isNotEmpty)
              ButtonWidget(text: 'Add to cart', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
