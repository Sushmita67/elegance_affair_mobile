import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/product_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../data_source/local_datasource/product_local_data_source.dart';

class ProductLocalRepository implements IProductRepository {
  final ProductLocalDataSource _productLocalDataSource;

  ProductLocalRepository({
    required ProductLocalDataSource productLocalDataSource,
  }) : _productLocalDataSource = productLocalDataSource;

  @override
  Future<Either<Failure, void>> createProduct(ProductEntity product) async {
    try {
      await _productLocalDataSource.createProduct(product);
      return Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error creating product: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(
      String productId, String? token) async {
    try {
      await _productLocalDataSource.deleteProduct(productId, token);
      return Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error deleting product: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final products = await _productLocalDataSource.getAllProducts();
      return Right(products);
    } catch (e) {
      return Left(
          LocalDatabaseFailure(message: 'Error fetching all products: $e'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(
      String productId) async {
    try {
      final product = await _productLocalDataSource.getProductById(productId);
      return Right(product);
    } catch (e) {
      return Left(
          LocalDatabaseFailure(message: 'Error fetching product by ID: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(
      ProductEntity productEntity, dynamic param) async {
    try {
      await _productLocalDataSource.updateProduct(productEntity);
      return Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error updating product: $e'));
    }
  }
}
