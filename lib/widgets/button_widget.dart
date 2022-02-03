import 'package:flutter/material.dart';
import 'package:shopy/constants/styles.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 21),
        decoration: BoxDecoration(
          color: color ?? kPrimaryButtonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor ?? kPrimaryButtonTextColor,
            ),
          ),
        ),
      ),
      onTap: () => onPressed(),
    );
  }
}
