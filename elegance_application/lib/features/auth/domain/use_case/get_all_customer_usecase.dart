import 'package:dartz/dartz.dart';
import 'package:elegance_application/features/auth/domain/entity/customer_entity.dart';
import 'package:elegance_application/features/auth/domain/repository/customer_repository.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';

class GetAllCustomerUsecase implements UsecaseWithoutParams {
  final ICustomerRepository customerRepository;

  const GetAllCustomerUsecase({required this.customerRepository});

  @override
  Future<Either<Failure, List<CustomerEntity>>> call() {
    return customerRepository.getAllCustomers();
  }
}
