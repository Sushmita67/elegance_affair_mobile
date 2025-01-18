import 'package:bloc/bloc.dart';
import 'package:elegance_application/features/auth/domain/use_case/create_customer_usecase.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final CreateCustomerUsecase _createCustomerUsecase;

  RegisterBloc({
    required CreateCustomerUsecase createCustomerUsecase,
  })  : _createCustomerUsecase = createCustomerUsecase,
        super(RegisterState.initial()) {
    on<RegisterCustomer>(_onRegisterCustomer);
  }

  Future<void> _onRegisterCustomer(
      RegisterCustomer event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));

    final params = CreateCustomerParams(
      fName: event.fName,
      lName: event.lName,
      phone: event.phone,
      username: event.username,
      password: event.password,
    );

    final result = await _createCustomerUsecase.call(params);

    result.fold(
        (failure) => emit(state.copyWith(isLoading: false, isSuccess: false)),
        (customer) => emit(state.copyWith(isLoading: false, isSuccess: true)));
  }
}
