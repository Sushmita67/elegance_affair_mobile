import 'package:elegance_application/features/auth/data/data_source/customer_data_source.dart';
import 'package:elegance_application/features/auth/data/model/customer_hive_model.dart';
import 'package:elegance_application/features/auth/domain/entity/customer_entity.dart';

import '../../../../../core/network/hive_service.dart';

class CustomerLocalDatasource implements ICustomerDataSource {
  final HiveService _hiveService;

  CustomerLocalDatasource(this._hiveService);

  @override
  Future<void> createCustomer(CustomerEntity customerEntity) async {
    try {
      final customerHiveModel = CustomerHiveModel.fromEntity(customerEntity);
      await _hiveService.addCustomer(customerHiveModel);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteCustomer(String id) async {
    try {
      return await _hiveService.deleteCustomer(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<CustomerEntity>> getAllCustomers() async {
    try {
      return await _hiveService.getAllCustomers().then((value) {
        return value.map((e) => e.toEntity()).toList();
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CustomerEntity> login(String username, String password) async {
    try {
      final customerHiveModel =
          await _hiveService.loginCustomer(username, password);
      return customerHiveModel!.toEntity();
    } catch (e) {
      throw Exception(e);
    }
  }
}
