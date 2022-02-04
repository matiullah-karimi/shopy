import 'package:flutter/material.dart';
import 'package:shopy/constants/styles.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    Key? key,
    this.controller,
    this.autoFocus,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool? autoFocus;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus ?? false,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: kSearchInputBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: kSearchInputFocusBorderColor),
        ),
      ),
    );
  }
}
