import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:shopy/model/product.dart';

class CartState {
  final List<Product> products;
  CartState({
    required this.products,
  });

  // initial state
  factory CartState.initial() {
    return CartState(
      products: [],
    );
  }

  bool isAdded(Product product) {
    return products.contains(product);
  }

  CartState copyWith({
    List<Product>? products,
  }) {
    return CartState(
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory CartState.fromMap(Map<String, dynamic> map) {
    return CartState(
      products:
          List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartState.fromJson(String source) =>
      CartState.fromMap(json.decode(source));

  @override
  String toString() => 'CartState(products: $products)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartState && listEquals(other.products, products);
  }

  @override
  int get hashCode => products.hashCode;
}
