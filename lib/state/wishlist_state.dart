import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:shopy/model/product.dart';

class WishlistState {
  final List<Product> products;
  WishlistState({
    required this.products,
  });

  // initial state
  factory WishlistState.initial() {
    return WishlistState(
      products: [],
    );
  }

  bool isFavorite(Product product) {
    return products.contains(product);
  }

  WishlistState copyWith({
    List<Product>? products,
  }) {
    return WishlistState(
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory WishlistState.fromMap(Map<String, dynamic> map) {
    return WishlistState(
      products:
          List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory WishlistState.fromJson(String source) =>
      WishlistState.fromMap(json.decode(source));

  @override
  String toString() => 'WishlistState(products: $products)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WishlistState && listEquals(other.products, products);
  }

  @override
  int get hashCode => products.hashCode;
}
