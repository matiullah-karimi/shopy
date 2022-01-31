import 'package:flutter/material.dart';
import 'package:shopy/widgets/bottom_bar_widget.dart';
import 'package:shopy/widgets/home/home_categories.dart';
import 'package:shopy/widgets/home/home_top_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBarWidget(),
      body: Column(
        children: [
          const HomeTopWidget(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: const HomeCategoriesWidget(),
          ),
          Expanded(
            child: Container(
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
