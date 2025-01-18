import 'package:dartz/dartz.dart';
import 'package:elegance_application/features/auth/domain/entity/customer_entity.dart';
import 'package:elegance_application/features/auth/domain/repository/customer_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';

class CreateCustomerParams extends Equatable {
  final String fName;
  final String lName;
  final String phone;
  final String username;
  final String password;
  final String? image;

  const CreateCustomerParams({
    required this.fName,
    required this.lName,
    required this.phone,
    required this.username,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props => [
        fName,
        lName,
        phone,
        username,
        password,
        image,
      ];
}

class CreateCustomerUsecase
    implements UsecaseWithParams<void, CreateCustomerParams> {
  final ICustomerRepository customerRepository;

  const CreateCustomerUsecase({required this.customerRepository});

  @override
  Future<Either<Failure, void>> call(CreateCustomerParams params) async {
    // Create the customer entity from the params
    final customerEntity = CustomerEntity(
      customerId: null, // The ID will be generated automatically
      fname: params.fName,
      lname: params.lName,
      phone: params.phone,
      username: params.username,
      password: params.password,
      image: params.image,
    );

    // Call the repository method to create the customer
    return await customerRepository.createCustomer(customerEntity);
  }
}
