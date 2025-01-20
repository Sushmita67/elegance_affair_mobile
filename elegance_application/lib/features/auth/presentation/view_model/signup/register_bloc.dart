import 'package:bloc/bloc.dart';
import 'package:elegance_application/core/common/snackbar/snackbar.dart';
import 'package:elegance_application/features/auth/domain/use_case/create_customer_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final CreateCustomerUsecase _registerUseCase;

  RegisterBloc({
    required CreateCustomerUsecase registerUseCase,
    required CreateCustomerUsecase createCustomerUsecase,
  })  : _registerUseCase = registerUseCase,
        super(RegisterState.initial()) {
    on<RegisterCustomer>(_onRegisterEvent);
  }

  void _onRegisterEvent(
    RegisterCustomer event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _registerUseCase.call(CreateCustomerParams(
      fname: event.fName,
      lname: event.lName,
      phone: event.phone,
      email: event.email,
      password: event.password,
      fName: '',
      lName: '',
      username: '',
    ));

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
            context: event.context, message: "Registration Successful");
      },
    );
  }
}
