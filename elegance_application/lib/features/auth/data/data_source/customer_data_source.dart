import '../../domain/entity/customer_entity.dart';

abstract interface class ICustomerDataSource {
  Future<void> createCustomer(CustomerEntity customerEntity);
  Future<List<CustomerEntity>> getAllCustomers();
  Future<void> deleteCustomer(String id);
  Future<CustomerEntity> login(String username, String password);
}
