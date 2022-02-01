import 'package:shopy/model/product.dart';

class ProductState {
  final bool isLoading;
  final String error;
  final List<Product> products;
  final int page;
  final int total;

  ProductState({
    this.isLoading = false,
    this.error = '',
    this.products = const [],
    this.page = 1,
    this.total = 0,
  });

  factory ProductState.initial() {
    return ProductState(
      products: [],
      isLoading: false,
      page: 1,
      total: 0,
    );
  }

  factory ProductState.loading() {
    return ProductState(
      isLoading: true,
    );
  }

  factory ProductState.success(List<Product> products, int page, int total) {
    return ProductState(
      products: products,
      isLoading: false,
      page: page,
      total: total,
    );
  }

  factory ProductState.failure(String error) {
    return ProductState(
      isLoading: false,
      error: error,
    );
  }

  @override
  String toString() {
    return '''ProductState {
      isLoading: $isLoading,
      error: $error,
      products: $products,
      page: $page,
      total: $total,
    }''';
  }
}
