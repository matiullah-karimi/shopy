import 'package:flutter/material.dart';
import 'package:shopy/constants/styles.dart';

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({
    Key? key,
    required this.isFavorite,
    required this.onTap,
  }) : super(key: key);

  final bool isFavorite;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        child: Icon(
          Icons.favorite,
          color: isFavorite ? Colors.red : kTextColorMedium,
        ),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey.shade100,
        ),
      ),
    );
  }
}
