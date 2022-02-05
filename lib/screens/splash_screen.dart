import 'package:flutter/material.dart';
import 'package:shopy/constants/styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBgColor,
      child: Center(
        child: Text(
          'Shoppy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: kTextColorLight,
          ),
        ),
      ),
    );
  }
}
