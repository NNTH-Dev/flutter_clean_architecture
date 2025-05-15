import 'package:flutter_clean_architecture/core/routes/route.names.dart';
import 'package:flutter_clean_architecture/features/products/domain/entities/product.entity.dart';
import 'package:flutter_clean_architecture/features/products/presentation/screens/detail_screen.dart';
import 'package:flutter_clean_architecture/features/products/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (RouteNames.homeScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case (RouteNames.productDetailScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => DetailScreen(
                  product: settings.arguments as ProductEntity,
                ));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No route is configured"),
            ),
          ),
        );
    }
  }
}
