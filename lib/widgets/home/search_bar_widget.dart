import 'package:flutter/material.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/screens/search_result_screen.dart';
import 'package:shopy/utils/navigator.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kBgColor,
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: TextFormField(
                readOnly: true,
                onTap: () => navigate(context, const SearchResultScreen()),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
