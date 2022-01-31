import 'package:flutter/material.dart';
import 'package:shopy/widgets/button_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade800,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Logo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonWidget(
                  text: 'Sign up',
                  onPressed: () {},
                ),
                ButtonWidget(
                  text: 'Sign in',
                  onPressed: () {},
                  color: Colors.blue.shade800,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
