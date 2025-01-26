import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/customer_entity.dart';
import '../../domain/repository/customer_repository.dart';
import '../data_source/remote_datasource/user_remote_datasource.dart';


class UserRemoteRepository implements ICustomerRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRemoteRepository(this._userRemoteDataSource);

  @override
  Future<Either<Failure, void>> createCustomer(CustomerEntity customerEntity) async {
    try {
      await _userRemoteDataSource.createUser(customerEntity);
      return const Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: 'Error creating user: $e',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<CustomerEntity>>> getAllUsers() async {
    try {
      final users = await _userRemoteDataSource.getAllUsers();
      return Right(users);
    } catch (e) {
      return Left(
        LocalDatabaseFailure(
          message: 'Error fetching all users: $e',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(String id) async {
    try {
      await _userRemoteDataSource.deleteUser(id);
      return const Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: 'Error deleting user: $e',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CustomerEntity>> login(
      String username, String password) async {
    try {
      final user = await _userRemoteDataSource.login(username, password);
      return Right(user);
    } catch (e) {
      return Left(
        ApiFailure(
          message: 'Login failed: $e',
        ),
      );
    }
  }



  @override
  Future<Either<Failure, void>> deleteCustomer(String id) {
    // TODO: implement deleteCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CustomerEntity>>> getAllCustomers() {
    // TODO: implement getAllCustomers
    throw UnimplementedError();
  }
}
