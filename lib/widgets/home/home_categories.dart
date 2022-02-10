import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/widgets/home/category_item_widget.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      const CategoryItemWidget(
        title: 'Male',
        icon: FontAwesomeIcons.male,
      ),
      const CategoryItemWidget(
        title: 'Female',
        icon: FontAwesomeIcons.female,
      ),
      const CategoryItemWidget(
        title: 'Kid',
        icon: FontAwesomeIcons.child,
      ),
      const CategoryItemWidget(
        title: 'Electronics',
        icon: FontAwesomeIcons.mobile,
      ),
    ];
    return Row(
      children: items,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
