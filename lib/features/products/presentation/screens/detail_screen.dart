import 'package:flutter_clean_architecture/core/res/app.context.extension.dart';
import 'package:flutter_clean_architecture/core/res/resources.dart';
import 'package:flutter_clean_architecture/features/products/domain/entities/product.entity.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final ProductEntity product;
  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;

    return Scaffold(
      backgroundColor: resources.colors.primary,
      appBar: AppBar(
        backgroundColor: resources.colors.primary,
        title: const Text('Product Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.imageUrl ?? '',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(height: resources.dimensions.primaryPadding),
          Padding(
            padding: EdgeInsets.all(resources.dimensions.primaryPadding),
            child: Text(
              product.name ?? '',
              style: TextStyle(
                fontSize: resources.sizes.headTextFontSize2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(resources.dimensions.primaryPadding),
            child: Text(
              "Price: ${product.price ?? ''}",
              style: TextStyle(
                fontSize: resources.sizes.primaryTextFontSize,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
