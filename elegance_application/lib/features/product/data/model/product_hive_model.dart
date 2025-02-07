import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/constants/hive_table_constant.dart';
import '../../domain/entity/product_entity.dart';

part 'product_hive_model.g.dart';

// Command to Generate Adapter: dart run build_runner build -d
// Need to run each time changes are made to the model.

@HiveType(typeId: HiveTableConstant.productTableId)
class ProductHiveModel extends Equatable {
  @HiveField(0)
  final String? productId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final double? discountPrice;

  @HiveField(5)
  final String? photo;

  ProductHiveModel({
    String? productId,
    required this.title,
    this.description,
    required this.price,
    this.discountPrice,
    this.photo,
  }) : productId = productId ?? const Uuid().v4();

  // Initial Constructor
  const ProductHiveModel.initial()
      : productId = '',
        title = '',
        description = null,
        price = 0.0,
        discountPrice = null,
        photo = null;
  // From Entity
  factory ProductHiveModel.fromEntity(ProductEntity entity) {
    return ProductHiveModel(
      productId: entity.id,
      title: entity.title,
      description: entity.description,
      price: entity.price,
      discountPrice: entity.discountPrice,
      photo: entity.photo,
    );
  }

  // To Entity
  ProductEntity toEntity() {
    return ProductEntity(
      id: productId,
      title: title,
      description: description,
      price: price,
      discountPrice: discountPrice,
      photo: photo,
    );
  }

  // To Entity List
  static List<ProductHiveModel> fromEntityList(List<ProductEntity> entityList) {
    return entityList
        .map((entity) => ProductHiveModel.fromEntity(entity))
        .toList();
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

@HiveType(typeId: HiveTableConstant.productModuleTableId)
class ProductModuleHiveModel extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int price;

  ProductModuleHiveModel({
    required this.name,
    required this.price,
  });

  // From Entity
  factory ProductModuleHiveModel.fromEntity(ModuleEntity entity) {
    return ProductModuleHiveModel(
      name: entity.name,
      price: entity.price,
    );
  }

  // To Entity
  ModuleEntity toEntity() {
    return ModuleEntity(
      name: name,
      price: price,
    );
  }

  @override
  List<Object?> get props => [name, price];
}
