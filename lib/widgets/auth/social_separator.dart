import 'package:flutter/material.dart';

class LoginSocialSeparator extends StatelessWidget {
  const LoginSocialSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey.shade200, Colors.grey.shade400],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.5, 0.0),
                stops: const [0.0, 1.0],
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
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade400,
                  Colors.grey.shade300,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.5, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
