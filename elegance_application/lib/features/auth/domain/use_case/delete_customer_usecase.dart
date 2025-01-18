import 'package:dartz/dartz.dart';
import 'package:elegance_application/features/auth/domain/repository/customer_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';

class DeleteCustomerParams extends Equatable {
  final String customerId;

  const DeleteCustomerParams({required this.customerId});

  const DeleteCustomerParams.empty() : customerId = "_empty.string";

  @override
  List<Object?> get props => [customerId];
}

class DeleteCustomerUsecase
    implements UsecaseWithParams<void, DeleteCustomerParams> {
  final ICustomerRepository customerRepository;

  const DeleteCustomerUsecase({required this.customerRepository});

  @override
  Future<Either<Failure, void>> call(DeleteCustomerParams params) async {
    return await customerRepository.deleteCustomer(params.customerId);
  }
}
