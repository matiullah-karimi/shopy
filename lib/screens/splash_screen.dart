import 'package:flutter/material.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/screens/login_screen.dart';
import 'package:shopy/screens/signup_screen.dart';
import 'package:shopy/utils/navigator.dart';
import 'package:shopy/widgets/button_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBgColor,
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
                  onPressed: () => navigate(context, const SignupScreen()),
                  color: kTextColorLight,
                  textColor: kTextColorDark,
                ),
                ButtonWidget(
                  text: 'Sign in',
                  onPressed: () => navigate(context, const LoginScreen()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
