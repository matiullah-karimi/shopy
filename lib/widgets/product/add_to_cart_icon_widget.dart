import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/providers/auth_provider.dart';
import 'package:shopy/providers/cart_provider.dart';
import 'package:shopy/screens/login_screen.dart';
import 'package:shopy/utils/navigator.dart';

class AddToCartIconWidget extends ConsumerWidget {
  const AddToCartIconWidget({
    Key? key,
    required this.product,
    this.color,
  }) : super(key: key);

  final Product product;
  final Color? color;

  @override
  Widget build(BuildContext context, ref) {
    void addToCart() {
      final authState = ref.watch(authStateProvider);

      if (!authState.authenticated) {
        return navigate(context, const LoginScreen());
      }

      ref.read(cartProvider.notifier).add(product);
      const snackBar = SnackBar(
        content: Text('Product added to the cart'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return InkWell(
      child: Icon(
        Icons.add_shopping_cart_sharp,
        color: color ?? kTextColorDark,
      ),
      onTap: () => addToCart(),
    );
  }
}
