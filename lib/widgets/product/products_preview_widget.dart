import 'package:flutter/material.dart';

class ProductsPreviewWidget extends StatelessWidget {
  const ProductsPreviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> data = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Title'),
              Text('See All'),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: GridView.count(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              crossAxisCount: 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: data.map(_buildProduct).toList(),
            ),
          )
        ],
      ),
    );
  }

  Container _buildProduct(String product) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
