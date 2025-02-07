part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

final class LoadProducts extends ProductEvent {}

final class AddProduct extends ProductEvent {
  final String title;
  final double price;
  final String difficultyLevel;
  final String categoryId;

  const AddProduct({
    required this.title,
    required this.price,
    required this.difficultyLevel,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [title, price, difficultyLevel, categoryId];
}

final class DeleteProduct extends ProductEvent {
  final String productId;

  const DeleteProduct({required this.productId});

  @override
  List<Object?> get props => [productId];
}

final class UpdateProduct extends ProductEvent {
  final String productId;
  final String title;
  final double price;
  final String description;

  const UpdateProduct({
    required this.productId,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  List<Object?> get props => [productId, title, price, description];
}
