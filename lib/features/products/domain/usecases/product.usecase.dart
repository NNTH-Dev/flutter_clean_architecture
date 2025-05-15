import 'package:flutter_clean_architecture/features/products/domain/entities/product.entity.dart';
import 'package:flutter_clean_architecture/features/products/domain/repositories/product.repository.dart';

class ProductUsecase {
  final ProductRepository _productRepository;

  ProductUsecase(this._productRepository);

  Future<List<ProductEntity>> fetchProducts() async {
    print('Fetching products from usecase');
    try {
      final products = await _productRepository.fetchProducts();

      if (products == []) {
        throw Exception('No products available');
      }

      return products;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductEntity>> filterProductsByName(String name) async {
    try {
      final products = await _productRepository.filterProductsByName(name);

      if (products == []) {
        throw Exception('No products available');
      }

      return products;
    } catch (e) {
      rethrow;
    }
  }
}
