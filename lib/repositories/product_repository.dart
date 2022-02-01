import 'package:shopy/model/product.dart';
import 'package:shopy/utils/custom_dio.dart';

class ProductRepository {
  Future<List<Product>> getAllProducts() async {
    final response = await customDio.get('/products');

    return (response.data as List)
        .map((item) => Product.fromMap(item))
        .toList();
  }
}
