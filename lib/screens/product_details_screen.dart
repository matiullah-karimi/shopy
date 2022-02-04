import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:shopy/widgets/product/add_to_cart_icon_widget.dart';
import 'package:shopy/widgets/product/favorite_icon_widget.dart';

class ProductDetailsScreen extends ConsumerWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Product details',
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kTextColorDark,
        tooltip: 'Add to cart',
        onPressed: () => {},
        child: AddToCartIconWidget(
          product: product,
          color: kTextColorLight,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 300,
            child: Image.network(
              product.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.headline6,
              ),
              FavoriteIconWidget(product: product)
            ],
          ),
          const SizedBox(height: 16),
          Text(
            product.title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Divider(
            height: 32,
            color: Colors.grey.shade200,
          ),
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Text(
            product.description,
            style: TextStyle(color: kTextColorMedium),
          ),
          const SizedBox(height: 16),
          ExpansionTile(
            tilePadding: const EdgeInsets.all(0),
            title: const Text('Details'),
            children: <Widget>[
              Text(product.description),
            ],
          ),
          ExpansionTile(
            tilePadding: const EdgeInsets.all(0),
            title: const Text('Specifications'),
            children: <Widget>[
              Text(product.description),
            ],
          ),
          ExpansionTile(
            tilePadding: const EdgeInsets.all(0),
            title: const Text('Refund policy'),
            children: <Widget>[
              Text(product.description),
            ],
          ),
        ],
      ),
    );
  }
}
