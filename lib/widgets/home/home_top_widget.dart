import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopy/widgets/home/home_featured_bar.dart';
import 'package:shopy/widgets/home/search_bar_widget.dart';

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: (MediaQuery.of(context).size.height * 0.3),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 24,
              left: 32,
              right: 32,
              child: Column(
                children: [
                  const HomeSearchBarWidget(),
                  Container(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.height * 0.3) - 50,
                    child: const HomeFeaturedBar(),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
