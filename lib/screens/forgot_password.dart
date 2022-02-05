import 'package:flutter/material.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/utils/validations.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:shopy/widgets/button_widget.dart';
import 'package:shopy/widgets/input_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Forgot Password',
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Please enter your email address and we will send your password to you by email immediately.',
                style: TextStyle(color: kTextColorDark),
              ),
              const SizedBox(height: 48),
              InputWidget(
                hintText: 'example@email.com',
                labelText: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                text: 'Send',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
