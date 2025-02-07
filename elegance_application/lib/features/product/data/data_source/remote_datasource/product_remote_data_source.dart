import 'package:dio/dio.dart';

import '../../../../../app/constants/api_enpoints.dart';
import '../../../domain/entity/product_entity.dart';
import '../../model/product_api_model.dart';

class ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSource(this._dio);

  Future<void> createProduct(ProductEntity product) async {
    try {
      // Convert entity to model
      var productApiModel = ProductApiModel.fromEntity(product);
      var response = await _dio.post(
        ApiEndpoints.createProduct,
        data: productApiModel.toJson(),
      );
      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductEntity>> getAllProducts() async {
    try {
      var response = await _dio.get(ApiEndpoints.getAllProducts);
      if (response.statusCode == 200) {
        var data = response.data as List<dynamic>;
        return data
            .map((product) => ProductApiModel.fromJson(product).toEntity())
            .toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ProductEntity> getProductById(String productId) async {
    try {
      var response =
          await _dio.get('${ApiEndpoints.getProductById}/$productId');
      if (response.statusCode == 200) {
        return ProductApiModel.fromJson(response.data).toEntity();
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateProduct(ProductEntity productEntity) async {
    try {
      var productApiModel = ProductApiModel.fromEntity(productEntity);
      var response = await _dio.put(
        '${ApiEndpoints.updateProduct}/${productEntity.id}',
        data: productApiModel.toJson(),
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteProduct(String productId, String? token) async {
    try {
      var response =
          await _dio.delete('${ApiEndpoints.deleteProduct}/$productId');
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
