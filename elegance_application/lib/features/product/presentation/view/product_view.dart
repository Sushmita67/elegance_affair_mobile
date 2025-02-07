import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/product_bloc.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});

  final productTitleController = TextEditingController();
  final productPriceController = TextEditingController();
  final productDifficultyLevelController = TextEditingController();
  final productProductController = TextEditingController();
  final _productFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _productFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: productTitleController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: productPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Product Price'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: productProductController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Product Product'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: productDifficultyLevelController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_productFormKey.currentState!.validate()) {
                    context.read<ProductBloc>().add(
                          AddProduct(
                            title: productTitleController.text,
                            price: double.parse(productPriceController.text),
                            difficultyLevel:
                                productDifficultyLevelController.text,
                            categoryId: productProductController.text,
                          ),
                        );
                    productTitleController.clear();
                    productPriceController.clear();
                    productDifficultyLevelController.clear();
                    productProductController.clear();
                  }
                },
                child: const Text('Add Product'),
              ),
              const SizedBox(height: 10),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state.error != null) {
                    return Center(child: Text('Error: ${state.error}'));
                  }
                  if (state.products.isEmpty) {
                    return const Center(child: Text('No Products Added Yet'));
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.products[index].title),
                          subtitle: Text(
                              'Rs. ${state.products[index].price?.toStringAsFixed(2)}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context.read<ProductBloc>().add(
                                    DeleteProduct(
                                      productId: state.products[index].id ?? '',
                                    ),
                                  );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
