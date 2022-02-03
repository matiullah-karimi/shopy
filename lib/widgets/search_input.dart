import 'package:flutter/material.dart';
import 'package:shopy/constants/styles.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
