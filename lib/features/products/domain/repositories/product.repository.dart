import 'package:flutter_clean_architecture/features/products/domain/entities/product.entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> fetchProducts();
  Future<List<ProductEntity>> filterProductsByName(String name);
}
