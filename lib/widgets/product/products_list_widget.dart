import 'package:flutter/material.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/widgets/product/product_list_item_2_widget.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: products
          .map((product) => ProductListItem2Widget(product: product))
          .toList(),
    );
  }
}
