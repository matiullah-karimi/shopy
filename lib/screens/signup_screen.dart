import 'package:flutter/material.dart';
import 'package:shopy/screens/login_screen.dart';
import 'package:shopy/utils/navigator.dart';
import 'package:shopy/utils/validations.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:shopy/widgets/auth/social_login_widget.dart';
import 'package:shopy/widgets/auth/social_separator.dart';
import 'package:shopy/widgets/button_widget.dart';
import 'package:shopy/widgets/input_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const AppBarWidget(title: 'Sign up'),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InputWidget(
                  hintText: 'John Doe',
                  labelText: 'Name',
                  controller: TextEditingController(),
                  validator: nameValidator,
                ),
                const SizedBox(height: 16),
                InputWidget(
                  hintText: 'example@email.com',
                  labelText: 'Email',
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidator,
                ),
                const SizedBox(height: 16),
                InputWidget(
                  hintText: '********',
                  labelText: 'Password',
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  validator: passwordValidator,
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Sign up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      navigate(context, const LoginScreen());
                    }
                  },
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
        ),
      ),
    );
  }
}
