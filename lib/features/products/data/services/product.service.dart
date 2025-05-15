import 'dart:convert';

import 'package:flutter_clean_architecture/features/products/data/models/product.model.dart';
import 'package:flutter/services.dart';

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response =
          await Future.delayed(const Duration(seconds: 2), () async {
        final jsonString =
            await rootBundle.loadString("lib/core/mock/product.json");

        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        final List<dynamic> jsonList = jsonMap['data'];

        return jsonList.map((e) => ProductModel.fromJson(e)).toList();
      });

      return response;
    } catch (e) {
      throw Exception('Failed to load products from JSON: $e');
    }
  }

  Future<List<ProductModel>> filterProductsByName(String name) async {
    try {
      final response = await fetchProducts();
      return response;
    } catch (e) {
      throw Exception('Failed to filter products: $e');
    }
  }
}
