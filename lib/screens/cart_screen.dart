import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/model/cart_item.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/providers/cart_provider.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:shopy/widgets/button_widget.dart';
import 'package:shopy/widgets/product/products_list_widget.dart';

class CartScreen extends HookConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    List<Product> products = ref.watch(cartProvider).products;
    final cartNotifier = ref.watch(cartProvider.notifier);

    return Scaffold(
      appBar: const AppBarWidget(title: 'My cart'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Add more products to your cart'),
                const Spacer(),
                InkWell(
                  onTap: () => cartNotifier.clear(),
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
              ButtonWidget(text: 'Checkout', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
