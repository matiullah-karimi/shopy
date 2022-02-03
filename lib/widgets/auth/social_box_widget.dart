import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialBoxWidget extends StatelessWidget {
  const SocialBoxWidget({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(8),
          // color: Colors.grey.shade300,
        ),
        child: Center(
          child: FaIcon(
            icon,
            size: 36,
            color: color,
          ),
        ),
      ),
    );
  }
}
