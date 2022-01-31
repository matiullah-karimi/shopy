import 'package:flutter/material.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      _buildCategory('Male', Icons.male),
      _buildCategory('Female', Icons.female),
      _buildCategory('Kids', Icons.child_care),
      _buildCategory('Sale', Icons.g_mobiledata),
    ];
    return Row(
      children: items,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  _buildCategory(String text, IconData icon) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Colors.blue.shade300,
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
        Text(text)
      ],
    );
  }
}
