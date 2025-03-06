
import 'package:elegance/core/error/failure.dart';
import 'package:elegance/features/product/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class IProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}