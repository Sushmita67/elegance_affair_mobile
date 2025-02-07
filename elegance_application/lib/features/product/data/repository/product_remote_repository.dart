import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/product_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../data_source/remote_datasource/product_remote_data_source.dart';

class ProductRemoteRepository implements IProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductRemoteRepository({
    required ProductRemoteDataSource productRemoteDataSource,
  }) : _productRemoteDataSource = productRemoteDataSource;

  @override
  Future<Either<Failure, void>> createProduct(ProductEntity product) async {
    try {
      await _productRemoteDataSource.createProduct(product);
      return Right(null);
    } catch (e) {
      return Left(ApiFailure(message: 'Error creating product: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(
      String productId, String? token) async {
    try {
      await _productRemoteDataSource.deleteProduct(productId, token);
      return Right(null);
    } catch (e) {
      return Left(ApiFailure(message: 'Error deleting product: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final products = await _productRemoteDataSource.getAllProducts();
      return Right(products);
    } catch (e) {
      return Left(ApiFailure(message: 'Error fetching all products: $e'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(
      String productId) async {
    try {
      final product = await _productRemoteDataSource.getProductById(productId);
      return Right(product);
    } catch (e) {
      return Left(ApiFailure(message: 'Error fetching product by ID: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(
      ProductEntity product, dynamic param) async {
    try {
      await _productRemoteDataSource.updateProduct(product);
      return Right(null);
    } catch (e) {
      return Left(ApiFailure(message: 'Error updating product: $e'));
    }
  }
}
