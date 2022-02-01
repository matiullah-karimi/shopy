import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/providers/product_provider.dart';
import 'package:shopy/widgets/home/home_categories.dart';
import 'package:shopy/widgets/home/home_top_widget.dart';
import 'package:shopy/widgets/product/products_preview_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final productState = ref.watch(productProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeTopWidget(),
            Container(
              color: Colors.white12,
              padding: const EdgeInsets.symmetric(vertical: 4),
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const HomeCategoriesWidget(),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  ProductsPreviewWidget(
                    title: 'Books',
                    products: productState.products,
                  ),
                  ProductsPreviewWidget(
                    title: 'Fruits',
                    products: productState.products,
                  ),
                  ProductsPreviewWidget(
                    title: 'Baby Needs',
                    products: productState.products,
                  ),
                  ProductsPreviewWidget(
                    title: 'Clothes',
                    products: productState.products,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
