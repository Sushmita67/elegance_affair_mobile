import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String title;
  final String? description;
  final double price;
  final double? discountPrice;
  final String? productId;
  final String? photo;

  const ProductEntity({
    this.id,
    required this.title,
    this.description,
    required this.price,
    this.discountPrice,
    this.productId,
    this.photo,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        discountPrice,
        productId,
        photo,
      ];

  static empty() {}
}

class ModuleEntity extends Equatable {
  final String name;
  final int price;

  const ModuleEntity({
    required this.name,
    required this.price,
  });

  @override
  List<Object?> get props => [name, price];
}
