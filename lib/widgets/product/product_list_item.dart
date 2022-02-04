import 'package:flutter/material.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/screens/product_details_screen.dart';
import 'package:shopy/utils/navigator.dart';
import 'package:shopy/widgets/product/add_to_cart_icon_widget.dart';
import 'package:shopy/widgets/product/favorite_icon_widget.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(context, ProductDetailsScreen(product: product)),
      child: SizedBox(
        width: 100,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FavoriteIconWidget(product: product),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product.title.substring(0, 10),
                style: TextStyle(
                  color: kTextColorDark,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: kTextColorMedium,
                ),
                child: Text(
                  '${product.id} colors',
                  style: TextStyle(
                    fontSize: 12,
                    color: kTextColorLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  AddToCartIconWidget(product: product)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
