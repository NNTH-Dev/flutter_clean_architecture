import 'package:flutter_clean_architecture/features/products/domain/entities/product.entity.dart';
import 'package:flutter_clean_architecture/features/products/domain/usecases/product.usecase.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel with ChangeNotifier {
  final ProductUsecase productUsecase;
  List<ProductEntity> productions = [];

  bool isLoading = true;
  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  HomeViewModel({required this.productUsecase}) {
    fetchProductions();
  }

  void fetchProductions() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2), () async {
      await productUsecase.fetchProducts().then((value) {
        productions = value;
      }).catchError((e) {
        productions = [];
      });

      isLoading = false;
      notifyListeners();
    });
  }

  void filterProductsByName(String name) async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2), () async {
      if (name.isEmpty) {
        fetchProductions();
        return;
      }

      await productUsecase.filterProductsByName(name).then((value) {
        productions = value;
      }).catchError((e) {
        productions = [];
      });
      isLoading = false;
      notifyListeners();
    });
  }
}
