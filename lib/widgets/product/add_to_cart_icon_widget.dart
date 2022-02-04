import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/providers/cart_provider.dart';

class AddToCartIconWidget extends ConsumerWidget {
  const AddToCartIconWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, ref) {
    void addToCart() {
      ref.read(cartProvider.notifier).add(product);
      const snackBar = SnackBar(
        content: Text('Product added to the cart'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: InkWell(
        child: const Icon(Icons.add),
        onTap: () => addToCart(),
      ),
    );
  }
}
