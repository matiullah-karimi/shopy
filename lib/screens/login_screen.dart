import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopy/screens/signup_screen.dart';
import 'package:shopy/utils/navigator.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:shopy/widgets/button_widget.dart';
import 'package:shopy/widgets/input_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Sign in'),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
                'Please fill E-mail & password to login your Shopy application account.'),
            const SizedBox(height: 46),
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
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () => navigate(context, const SignupScreen()),
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.blue.shade400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Sign in',
              onPressed: () {},
            ),
            const SizedBox(height: 48),
            _buildSeparator(),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSocialBox(FontAwesomeIcons.google, Colors.red.shade500),
                const SizedBox(width: 16),
                _buildSocialBox(Icons.facebook, Colors.blue),
              ],
            ),
            SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
                InkWell(
                  onTap: () => navigate(context, const SignupScreen()),
                  child: Text(
                    'Sign up',
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

  Row _buildSeparator() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey.shade200, Colors.grey.shade400],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.5, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
        Text(
          'Or continue with',
          style: TextStyle(color: Colors.grey.shade700),
        ),
        Expanded(
          child: Container(
            height: 2,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade400,
                  Colors.grey.shade300,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.5, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialBox(IconData icon, Color color) {
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
