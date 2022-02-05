import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/providers/product_provider.dart';
import 'package:shopy/utils/debouncer.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:shopy/widgets/product/product_list_item.dart';
import 'package:shopy/widgets/search_input.dart';

class SearchResultScreen extends HookConsumerWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productProvider);
    final searchController = useTextEditingController();
    final _debouncer = Debouncer(milliseconds: 500);

    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Search Result',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchInputWidget(
              controller: searchController,
              autoFocus: true,
              onChanged: (value) => _debouncer
                  .run(() => ref.read(productProvider.notifier).search(value)),
            ),
            const SizedBox(height: 16),
            if (productState.isLoading) const CircularProgressIndicator(),
            if (productState.products.isEmpty && !productState.isLoading)
              const Text('No result found'),
            if (!productState.isLoading)
              Expanded(
                child: GridView.builder(
                  itemCount: productState.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.8)),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductListItem(
                      product: productState.products[index],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
