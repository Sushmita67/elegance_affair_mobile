
import 'package:elegance/features/product/domain/entity/product_entity.dart';

abstract interface class IProductDataSource {
  Future<List<ProductEntity>> getProducts();
}