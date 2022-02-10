import 'dart:convert';

import 'package:flutter/foundation.dart';

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

  factory ProductState.loading(List<Product> products) {
    return ProductState(
      products: products,
      isLoading: false,
      page: 1,
      total: 0,
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
    return 'ProductState(isLoading: $isLoading, error: $error, products: $products, page: $page, total: $total)';
  }

  ProductState copyWith({
    bool? isLoading,
    String? error,
    List<Product>? products,
    int? page,
    int? total,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      products: products ?? this.products,
      page: page ?? this.page,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'error': error,
      'products': products.map((x) => x.toMap()).toList(),
      'page': page,
      'total': total,
    };
  }

  factory ProductState.fromMap(Map<String, dynamic> map) {
    return ProductState(
      isLoading: map['isLoading'] ?? false,
      error: map['error'] ?? '',
      products:
          List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
      page: map['page']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductState.fromJson(String source) =>
      ProductState.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductState &&
        other.isLoading == isLoading &&
        other.error == error &&
        listEquals(other.products, products) &&
        other.page == page &&
        other.total == total;
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^
        error.hashCode ^
        products.hashCode ^
        page.hashCode ^
        total.hashCode;
  }
}
