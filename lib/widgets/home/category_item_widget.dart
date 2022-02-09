import 'package:flutter/material.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/screens/search_result_screen.dart';
import 'package:shopy/utils/navigator.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigate(context, SearchResultScreen(category: title)),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              icon,
              size: 30,
              color: Colors.grey.shade100,
            ),
            decoration: BoxDecoration(
              color: kTextColorDark,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(title)
        ],
      ),
    );
  }
}
