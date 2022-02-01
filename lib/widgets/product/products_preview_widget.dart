import 'package:flutter/material.dart';
import 'package:shopy/model/product.dart';

class ProductsPreviewWidget extends StatelessWidget {
  const ProductsPreviewWidget({
    Key? key,
    required this.title,
    required this.products,
  }) : super(key: key);

  final String title;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              const Text('See All'),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: products.isEmpty
                ? const CircularProgressIndicator()
                : GridView.count(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: products.map(_buildProduct).toList(),
                  ),
          )
        ],
      ),
    );
  }

  Container _buildProduct(Product product) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
