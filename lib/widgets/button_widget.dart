import 'package:flutter/material.dart';

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
        height: 50,
        decoration: BoxDecoration(
          color: color ?? Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width / 1.2,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor ?? Colors.blue.shade800,
            ),
          ),
        ),
      ),
      onTap: () => onPressed(),
    );
  }
}
