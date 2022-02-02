import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/model/product.dart';

class ProductListItem2Widget extends HookConsumerWidget {
  const ProductListItem2Widget({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, ref) {
    final count = useState(1);

    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.network(
            product.image,
            height: 80,
            width: 80,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title.substring(0, 10),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => count.value--,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('${count.value}'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => count.value++,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
