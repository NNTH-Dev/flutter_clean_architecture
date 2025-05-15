import 'package:flutter_clean_architecture/core/res/app.context.extension.dart';
import 'package:flutter_clean_architecture/core/res/resources.dart';
import 'package:flutter_clean_architecture/core/routes/route.names.dart';
import 'package:flutter_clean_architecture/features/products/domain/entities/product.entity.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: resources.colors.primary,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4.0),
        ],
      ),
      child: Row(
        children: [
          Image(
            image: NetworkImage(product.imageUrl ?? ''),
            width: resources.sizes.imageProductWidth,
            height: resources.sizes.imageProductHeight,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                product.name ?? '',
                style: TextStyle(
                  fontSize: resources.sizes.headTextFontSize2 * 0.6,
                  color: resources.colors.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                product.price ?? '',
                style: TextStyle(
                  fontSize: resources.sizes.primaryTextFontSize,
                  color: resources.colors.primaryTextColor.withOpacity(0.7),
                ),
              ),
            ],
          )),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.productDetailScreen,
                  arguments: product);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: resources.colors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
