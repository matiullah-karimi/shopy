import 'package:flutter/material.dart';
import 'package:shopy/screens/login_screen.dart';
import 'package:shopy/utils/navigator.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:shopy/widgets/auth/social_login_widget.dart';
import 'package:shopy/widgets/auth/social_separator.dart';
import 'package:shopy/widgets/button_widget.dart';
import 'package:shopy/widgets/input_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Sign up'),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputWidget(
              hintText: 'John Doe',
              labelText: 'Name',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16),
            InputWidget(
              hintText: 'example@email.com',
              labelText: 'Email',
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            InputWidget(
              hintText: '********',
              labelText: 'Password',
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Sign up',
              onPressed: () {},
            ),
            const SizedBox(height: 48),
            const LoginSocialSeparator(),
            const SizedBox(height: 50),
            const SocialLoginWidget(),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Alread have an account? ',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
                InkWell(
                  onTap: () => navigate(context, const LoginScreen()),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.blue.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
