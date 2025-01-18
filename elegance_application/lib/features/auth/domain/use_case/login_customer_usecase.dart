import 'package:dartz/dartz.dart';
import 'package:elegance_application/features/auth/domain/repository/customer_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';

class LoginCustomerParams extends Equatable {
  final String username;
  final String password;

  const LoginCustomerParams({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}

class LoginCustomerUsecase
    implements UsecaseWithParams<void, LoginCustomerParams> {
  final ICustomerRepository customerRepository;

  const LoginCustomerUsecase({required this.customerRepository});

  @override
  Future<Either<Failure, void>> call(LoginCustomerParams params) async {
    return await customerRepository.login(params.username, params.password);
  }
}
