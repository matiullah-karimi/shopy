import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/state/cart_state.dart';
import 'package:collection/collection.dart';

final cartProvider = StateNotifierProvider<WishlistNotifier, CartState>((ref) {
  return WishlistNotifier(CartState.initial());
});

class WishlistNotifier extends StateNotifier<CartState> {
  WishlistNotifier(CartState state) : super(state);

  void add(Product product) {
    final existingProduct = state.products.firstWhereOrNull(
      (p) => p.id == product.id,
    );

    if (existingProduct != null) {
      increment(product);
      return;
    }

    state = state.copyWith(
      products: List.from(state.products)..add(product),
    );
  }

  void remove(Product product) {
    state = state.copyWith(
      products: List.from(state.products)..remove(product),
    );
  }

  void clear() {
    state = state.copyWith(products: []);
  }

  void increment(Product product) {
    state = state.copyWith(
        products: state.products
            .map((p) => p.id == product.id
                ? product.copyWith(quantity: p.quantity + 1)
                : p)
            .toList());
  }

  void decrement(Product product) {
    if (product.quantity == 1) {
      remove(product);
      return;
    }

    state = state.copyWith(
        products: state.products
            .map((p) => p.id == product.id
                ? product.copyWith(quantity: p.quantity - 1)
                : p)
            .toList());
  }
}
