import 'package:dartz/dartz.dart';
import 'package:elegance_application/features/auth/data/data_source/local_datasource/customer_local_datasource.dart';
import 'package:elegance_application/features/auth/domain/entity/customer_entity.dart';
import 'package:elegance_application/features/auth/domain/repository/customer_repository.dart';

import '../../../../core/error/failure.dart';

class CustomerLocalRepository implements ICustomerRepository {
  final CustomerLocalDatasource _customerLocalDataSource;

  CustomerLocalRepository(
      {required CustomerLocalDatasource customerLocalDataSource})
      : _customerLocalDataSource = customerLocalDataSource;

  @override
  Future<Either<Failure, void>> createCustomer(CustomerEntity customerEntity) {
    try {
      _customerLocalDataSource.createCustomer(customerEntity);
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCustomer(String id) async {
    try {
      await _customerLocalDataSource.deleteCustomer(id);
      return Right(null);
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<CustomerEntity>>> getAllCustomers() async {
    try {
      final List<CustomerEntity> customers =
          await _customerLocalDataSource.getAllCustomers();
      return Right(customers);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerEntity>> login(
      String username, String password) async {
    try {
      final customer = await _customerLocalDataSource.login(username, password);
      return (Right(customer));
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }
}
