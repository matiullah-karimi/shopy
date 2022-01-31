import 'package:flutter/material.dart';
import 'package:shopy/widgets/bottom_bar_widget.dart';
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
            height: 100,
            color: Colors.white,
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
