part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<ProductEntity> products;
  final bool isLoading;
  final String? error;
  final ProductEntity? updatedProduct;

  const ProductState({
    required this.products,
    required this.isLoading,
    this.error,
    this.updatedProduct,
  });

  factory ProductState.initial() {
    return ProductState(
      products: [],
      isLoading: false,
      error: null,
      updatedProduct: null,
    );
  }

  ProductState copyWith({
    List<ProductEntity>? products,
    bool? isLoading,
    String? error,
    ProductEntity? updatedProduct,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      updatedProduct: updatedProduct ?? this.updatedProduct,
    );
  }

  @override
  List<Object?> get props => [products, isLoading, error, updatedProduct];
}
