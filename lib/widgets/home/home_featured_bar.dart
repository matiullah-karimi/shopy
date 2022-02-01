import 'package:flutter/material.dart';
import 'package:shopy/widgets/product/product_featured_item_widget.dart';

class HomeFeaturedBar extends StatefulWidget {
  const HomeFeaturedBar({Key? key}) : super(key: key);

  @override
  State<HomeFeaturedBar> createState() => _HomeFeaturedBarState();
}

class _HomeFeaturedBarState extends State<HomeFeaturedBar> {
  final PageController controller = PageController(viewportFraction: 1.1);
  int pageIndex = 0;

  final items = const <Widget>[
    ProductFeaturedItemWidget(),
    ProductFeaturedItemWidget(),
    ProductFeaturedItemWidget(),
    ProductFeaturedItemWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          onPageChanged: (value) => setState(() => pageIndex = value),
          controller: controller,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var i = 0; i < items.length; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: pageIndex == i ? Colors.black : Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
