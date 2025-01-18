import 'package:dartz/dartz.dart';
import 'package:elegance_application/features/auth/domain/entity/customer_entity.dart';

import '../../../../core/error/failure.dart';

abstract interface class ICustomerRepository {
  Future<Either<Failure, void>> createCustomer(CustomerEntity customerEntity);
  Future<Either<Failure, List<CustomerEntity>>> getAllCustomers();
  Future<Either<Failure, void>> deleteCustomer(String id);
  Future<Either<Failure, CustomerEntity>> login(
      String username, String password);
}
