import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopy/constants/styles.dart';

class ProductFeaturedItemWidget extends StatelessWidget {
  const ProductFeaturedItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: pi / 2,
            child: Image.network(
                'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
          ),
          const SizedBox(width: 32),
          Column(
            children: [
              const Text('Popular'),
              const SizedBox(height: 8),
              const Text('Air Max 2019',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: kPrimaryButtonColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      color: kTextColorLight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
