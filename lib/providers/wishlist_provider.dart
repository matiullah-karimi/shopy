import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/model/product.dart';
import 'package:shopy/state/wishlist_state.dart';

final wishlistProvider =
    StateNotifierProvider<WishlistNotifier, WishlistState>((ref) {
  return WishlistNotifier(WishlistState.initial());
});

class WishlistNotifier extends StateNotifier<WishlistState> {
  WishlistNotifier(WishlistState state) : super(state);

  void toggle(Product product) {
    if (state.products.contains(product)) {
      remove(product);
    } else {
      add(product);
    }
  }

  void add(Product product) {
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
}
