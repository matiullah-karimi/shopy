import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;

  const InputWidget(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      this.keyboardType,
      this.obscureText,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(labelText),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hintText,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
