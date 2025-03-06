import 'package:elegance/app/constants/api_endpoints.dart';
import 'package:elegance/features/product/data/data_source/product_data_source.dart';
import 'package:elegance/features/product/data/model/product_api_model.dart';
import 'package:elegance/features/product/domain/entity/product_entity.dart';
import 'package:dio/dio.dart';

class ProductRemoteDataSource implements IProductDataSource {
  final Dio _dio;

  ProductRemoteDataSource({
    required Dio dio,
  }) : _dio = dio;

   @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      final response = await _dio.get(ApiEndpoints.getAllProducts);
      if (response.statusCode == 200) {
        // Assuming the API returns a JSON array of products
        final List products = response.data;
        return products
            .map((json) => ProductApiModel.fromJson(json).toEntity())
            .toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
