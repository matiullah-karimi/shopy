import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  _buildSearchBar(),
                  Container(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.height * 0.3) - 50,
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

  Container _buildSearchBar() {
    return Container(
      width: double.infinity,
      color: Colors.blue,
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
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(Icons.filter_list),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
