import '../../domain/entity/product_entity.dart';

abstract interface class IProductDataSource {
  Future<void> createProduct(ProductEntity productEntity);

  Future<List<ProductEntity>> getAllProducts();

  Future<ProductEntity> getProductById(String productId);

  Future<void> updateProduct(ProductEntity productEntity);

  Future<void> deleteProduct(String productId, String? token);
}
