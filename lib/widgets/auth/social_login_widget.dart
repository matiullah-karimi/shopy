import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopy/widgets/auth/social_box_widget.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SocialBoxWidget(
            icon: FontAwesomeIcons.google, color: Colors.red.shade500),
        const SizedBox(width: 16),
        const SocialBoxWidget(icon: Icons.facebook, color: Colors.blue),
      ],
    );
  }
}
