import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/providers/product_provider.dart';
import 'package:shopy/utils/debouncer.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:shopy/widgets/product/product_list_item.dart';
import 'package:shopy/widgets/search_input.dart';

class SearchResultScreen extends HookConsumerWidget {
  const SearchResultScreen({
    Key? key,
    this.category,
  }) : super(key: key);

  final String? category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productProvider);
    final productStateNotifier = ref.watch(productProvider.notifier);
    final searchController = useTextEditingController();
    final _debouncer = Debouncer(milliseconds: 500);
    final isEnd = useState(false);

    ScrollController _controller =
        useScrollController(initialScrollOffset: 10.0, keepScrollOffset: true);

    _controller.addListener(() {
      isEnd.value = _controller.offset == _controller.position.maxScrollExtent;

      if (isEnd.value && !productState.isLoading) {
        productStateNotifier.loadProducts(
          term: searchController.text,
          category: category ?? '',
        );
      }
    });

    return Scaffold(
      appBar: AppBarWidget(
        title: category ?? 'Search Result',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: () => ref.read(productProvider.notifier).refresh(),
          child: Column(
            children: [
              SearchInputWidget(
                controller: searchController,
                autoFocus: true,
                onChanged: (value) => _debouncer.run(
                  () => productStateNotifier.loadProducts(
                    term: searchController.text,
                    category: category ?? '',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (productState.isLoading && !isEnd.value)
                const CircularProgressIndicator(),
              if (productState.products.isEmpty && !productState.isLoading)
                const Text('No result found'),
              // if (!productState.isLoading)
              Expanded(
                child: GridView.builder(
                  controller: _controller,
                  itemCount: productState.products.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.8)),
                  itemBuilder: (BuildContext context, int index) {
                    if (index >= productState.products.length) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ProductListItem(
                      product: productState.products[index],
                    );
                  },
                ),
              ),
              // if (isEnd.value && productState.isLoading)
              //   const LinearProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
