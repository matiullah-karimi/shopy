import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopy/constants/styles.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      _buildCategory('Male', FontAwesomeIcons.male),
      _buildCategory('Female', FontAwesomeIcons.female),
      _buildCategory('Kid', FontAwesomeIcons.child),
      _buildCategory('Electronics', FontAwesomeIcons.mobile),
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
          width: 60,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Icon(
            icon,
            size: 30,
            color: Colors.blue.shade700,
          ),
          decoration: BoxDecoration(
            color: kHomeTopBgColor,
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
