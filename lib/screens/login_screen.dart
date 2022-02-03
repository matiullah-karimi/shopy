import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/providers/login_provider.dart';
import 'package:shopy/screens/signup_screen.dart';
import 'package:shopy/state/login_state.dart';
import 'package:shopy/utils/navigator.dart';
import 'package:shopy/utils/validations.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:shopy/widgets/auth/social_login_widget.dart';
import 'package:shopy/widgets/auth/social_separator.dart';
import 'package:shopy/widgets/button_widget.dart';
import 'package:shopy/widgets/input_widget.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final emailControler = useTextEditingController(text: '');
    final passwordControler = useTextEditingController(text: '');
    final _formKey = GlobalKey<FormState>();
    final loginState = ref.watch(loginProvider);

    ref.listen<LoginState>(loginProvider,
        (LoginState? prevState, LoginState newState) {
      if (newState.isSuccess) {
        Navigator.of(context).pop();
      }
    });

    return Scaffold(
      appBar: const AppBarWidget(title: 'Sign in'),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
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
                  controller: emailControler,
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidator,
                ),
                const SizedBox(height: 16),
                InputWidget(
                  hintText: '********',
                  labelText: 'Password',
                  controller: passwordControler,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  validator: passwordValidator,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () => navigate(context, const SignupScreen()),
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: kTextColorDark,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: loginState.isLoading ? 'Signing in...' : 'Sign in',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ref
                          .read(loginProvider.notifier)
                          .login(emailControler.text, passwordControler.text);
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
                          color: kTextColorDark,
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
