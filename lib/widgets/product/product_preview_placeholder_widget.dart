import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProductsPreviewPlaceholderWidget extends HookWidget {
  const ProductsPreviewPlaceholderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<int> numbers = List<int>.generate(10, (int index) => index + 1);

    AnimationController controller =
        useAnimationController(duration: const Duration(milliseconds: 500));
    Animation<Color?> colorTweenAnimation =
        ColorTween(begin: Colors.white, end: Colors.grey.shade100)
            .animate(controller);

    final animation = useAnimation(colorTweenAnimation);

    useEffect(() {
      controller.repeat(reverse: true);
    }, []);

    return GridView.count(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      crossAxisCount: 1,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 3),
      children:
          numbers.map((num) => _buildPlaceholderItem(num, animation)).toList(),
    );
  }

  Widget _buildPlaceholderItem(int number, color) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
