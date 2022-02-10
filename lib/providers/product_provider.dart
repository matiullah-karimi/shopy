import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/repositories/product_repository.dart';
import 'package:shopy/state/product_state.dart';

final productRepositoryProvider = StateProvider<ProductRepository>((ref) {
  return ProductRepository();
});

final productProvider =
    StateNotifierProvider<ProductStateNotifier, ProductState>((ref) {
  final productRepo = ref.watch(productRepositoryProvider);
  return ProductStateNotifier(ProductState.initial(), productRepo);
});

class ProductStateNotifier extends StateNotifier<ProductState> {
  ProductStateNotifier(ProductState state, this.productRepository)
      : super(state) {
    loadProducts();
  }

  ProductRepository productRepository;

  Future<void> loadProducts({String term = '', String category = ''}) async {
    state = state.copyWith(isLoading: true, page: state.page + 1);

    try {
      final products =
          await productRepository.getAllProducts(state.page, term, category);
      state = state.copyWith(
        products: [...state.products, ...products],
        isLoading: false,
      );
    } catch (e) {
      state = ProductState.failure(e.toString());
    }
  }

  Future<void> refresh() async {
    state = state.copyWith(isLoading: true);

    try {
      final products = await productRepository.getAllProducts(1, '', '');
      state = ProductState.success(products, 1, products.length);
    } catch (e) {
      state = ProductState.failure(e.toString());
    }
  }
}
