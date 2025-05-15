import 'package:flutter_clean_architecture/features/products/data/repositories/production.repository.dart';
import 'package:flutter_clean_architecture/features/products/data/services/product.service.dart';
import 'package:flutter_clean_architecture/features/products/domain/repositories/product.repository.dart';
import 'package:flutter_clean_architecture/features/products/domain/usecases/product.usecase.dart';
import 'package:flutter_clean_architecture/features/products/presentation/view_model/home.viewmodel.dart';
import 'package:provider/provider.dart';

class ProductProvider {
  static List<dynamic> provider = [
    Provider<ProductService>(
      create: (context) => ProductService(),
    ),
    Provider<ProductRepository>(
      create: (context) => ProductRepositoryImpl(
          producctService: context.read<ProductService>()),
    ),
    Provider<ProductUsecase>(
      create: (context) => ProductUsecase(context.read<ProductRepository>()),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) =>
          HomeViewModel(productUsecase: context.read<ProductUsecase>()),
    ),
  ];
}
