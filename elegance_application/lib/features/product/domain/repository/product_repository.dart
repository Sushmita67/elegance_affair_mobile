import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/product_entity.dart';

abstract interface class IProductRepository {
  Future<Either<Failure, void>> createProduct(ProductEntity productEntity);

  Future<Either<Failure, List<ProductEntity>>> getAllProducts();

  Future<Either<Failure, ProductEntity>> getProductById(String productId);

  Future<Either<Failure, void>> updateProduct(ProductEntity productEntity, any);

  Future<Either<Failure, void>> deleteProduct(String productId, String? token);
}
