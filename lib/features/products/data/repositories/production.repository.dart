import 'package:flutter_clean_architecture/features/products/data/services/product.service.dart';
import 'package:flutter_clean_architecture/features/products/domain/entities/product.entity.dart';
import 'package:flutter_clean_architecture/features/products/domain/repositories/product.repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService producctService;
  ProductRepositoryImpl({required this.producctService});

  @override
  Future<List<ProductEntity>> fetchProducts() {
    print('Fetching products from repository');
    final response = producctService.fetchProducts();
    return response.then((value) {
      return value
          .map((e) => ProductEntity(
              id: e.id,
              name: e.name,
              price: "${e.price} \$",
              imageUrl: e.imageUrl))
          .toList();
    });
  }

  @override
  Future<List<ProductEntity>> filterProductsByName(String name) {
    // If just fetch data from json we can filter it here

    final response = producctService.filterProductsByName(name);
    return response.then((value) {
      return value
          .where((product) =>
              product.name?.toLowerCase().contains(name.toLowerCase()) ?? false)
          .map((e) => ProductEntity(
              id: e.id,
              name: e.name,
              price: "${e.price} \$",
              imageUrl: e.imageUrl))
          .toList();
    });
  }
}
