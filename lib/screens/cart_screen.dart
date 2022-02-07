import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/providers/cart_provider.dart';
import 'package:shopy/screens/checkout_screen.dart';
import 'package:shopy/utils/navigator.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:shopy/widgets/button_widget.dart';
import 'package:shopy/widgets/product/products_list_widget.dart';
import 'package:shopy/widgets/search_input.dart';

class CartScreen extends HookConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    List<Product> products = ref.watch(cartProvider).products;
    String formattedTotalPrice = ref.watch(cartProvider).formattedTotalPrice;
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
            const SearchInputWidget(),
            if (products.isNotEmpty)
              Expanded(child: ProductsListWidget(products: products)),
            if (products.isEmpty)
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: const Text('No products in cart')),
            if (products.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('Total'), Text(formattedTotalPrice)],
                ),
              ),
            if (products.isNotEmpty)
              ButtonWidget(
                text: 'Checkout',
                onPressed: () => navigate(
                  context,
                  const CheckoutScreen(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
