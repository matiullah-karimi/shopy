import 'dart:convert';

class Product {
  final int id;
  final String description;
  final String title;
  final String image;
  final double price;
  final int quantity;
  Product({
    required this.id,
    required this.description,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
  });

  Product copyWith({
    int? id,
    String? description,
    String? title,
    String? image,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      description: description ?? this.description,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'title': title,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      description: map['description'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, description: $description, title: $title, image: $image, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.description == description &&
        other.title == title &&
        other.image == image &&
        other.price == price &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        title.hashCode ^
        image.hashCode ^
        price.hashCode ^
        quantity.hashCode;
  }
}
