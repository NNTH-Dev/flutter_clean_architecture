import 'package:flutter_clean_architecture/features/products/presentation/view_model/home.viewmodel.dart';
import 'package:flutter_clean_architecture/core/res/app.context.extension.dart';
import 'package:flutter_clean_architecture/core/res/resources.dart';
import 'package:flutter_clean_architecture/features/products/presentation/widgets/product.item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;
    final HomeViewModel homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: resources.colors.primary,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(resources.dimensions.primaryPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBar(
                  controller: _searchController,
                  leading: IconButton(
                    onPressed: () {
                      homeViewModel
                          .filterProductsByName(_searchController.text);
                      FocusScope.of(context).unfocus();
                      _searchController.clear();
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
                SizedBox(height: resources.dimensions.primaryPadding),
                Text(
                  'Products',
                  style: TextStyle(fontSize: resources.sizes.headTextFontSize2),
                ),
                SizedBox(height: resources.dimensions.primaryPadding),
                Expanded(
                  child: homeViewModel.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : homeViewModel.productions.isEmpty
                          ? Center(
                              child: Text(
                                'No products found!',
                                style: TextStyle(
                                    fontSize: resources.sizes.headTextFontSize2,
                                    color: Colors.red.shade300),
                              ),
                            )
                          : ListView.builder(
                              clipBehavior: Clip.none,
                              itemCount: homeViewModel.productions.length,
                              itemBuilder: (context, index) {
                                final production =
                                    homeViewModel.productions[index];

                                return ProductItem(product: production);
                              }),
                ),
              ],
            ),
          ),
        ));
  }
}
