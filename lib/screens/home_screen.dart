import 'package:flutter/material.dart';
import 'package:shopy/widgets/bottom_bar_widget.dart';
import 'package:shopy/widgets/home/home_categories.dart';
import 'package:shopy/widgets/home/home_top_widget.dart';
import 'package:shopy/widgets/product/products_preview_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeTopWidget(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const HomeCategoriesWidget(),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: const [
                  ProductsPreviewWidget(),
                  ProductsPreviewWidget(),
                  ProductsPreviewWidget(),
                  ProductsPreviewWidget(),
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
