import 'package:shopy/model/product.dart';
import 'package:shopy/utils/custom_dio.dart';

class ProductRepository {
  Future<List<Product>> getAllProducts(
      int page, String term, String category) async {
    final response = await customDio
        .get('/products?limit=6&page=$page&term=$term&category=$category');

    return (response.data as List)
        .map((item) => Product.fromMap(item))
        .toList();
  }
}
