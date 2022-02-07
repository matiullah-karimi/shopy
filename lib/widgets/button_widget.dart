import 'package:flutter/material.dart';
import 'package:shopy/constants/styles.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool loading;
  final bool secondary;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.secondary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
        decoration: secondary ? kSecondaryButtonStyle : kPrimaryButtonStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading)
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),
            if (loading) const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: secondary ? kTextColorDark : kPrimaryButtonTextColor,
              ),
            ),
          ],
        ),
      ),
      onTap: () => onPressed(),
    );
  }
}
