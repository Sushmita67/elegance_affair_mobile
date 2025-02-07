import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/product_entity.dart';

part 'product_api_model.g.dart'; // Include the generated part file.

@JsonSerializable()
class ProductApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? productId;
  final String title;
  final String? description;
  final double price;
  final double? discountPrice;
  final String? photo;

  const ProductApiModel({
    this.productId,
    required this.title,
    this.description,
    required this.price,
    this.discountPrice,
    this.photo,
  });

  const ProductApiModel.empty()
      : productId = '',
        title = '',
        description = null,
        price = 0.0,
        discountPrice = null,
        photo = null;

  // From JSON
  factory ProductApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductApiModelFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$ProductApiModelToJson(this);

  // Convert API Object to Entity
  ProductEntity toEntity() => ProductEntity(
        id: productId,
        title: title,
        description: description,
        price: price,
        discountPrice: discountPrice,
        productId: productId,
        photo: photo,
      );

  // Convert Entity to API Object
  factory ProductApiModel.fromEntity(ProductEntity product) {
    return ProductApiModel(
      productId: product.id,
      title: product.title,
      description: product.description,
      price: product.price,
      discountPrice: product.discountPrice,
      photo: product.photo,
    );
  }

  // Convert API List to Entity List
  static List<ProductEntity> toEntityList(List<ProductApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  List<Object?> get props => [
        productId,
        title,
        description,
        price,
        discountPrice,
        photo,
      ];
}
