import 'package:bloc/bloc.dart';
import 'package:elegance_application/core/common/snackbar/snackbar.dart';
import 'package:elegance_application/features/auth/domain/use_case/create_customer_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'register_event.dart';
part 'register_state.dart';



class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  // final BatchBloc _batchBloc;
  // final WorkshopBloc _workshopBloc;
  final CreateCustomerUsecase _createCustomerUsecase;

  RegisterBloc({
    // required BatchBloc batchBloc,
    // required WorkshopBloc workshopBloc,
    required CreateCustomerUsecase createCustomerUsecase,
  })  :
  // _batchBloc = batchBloc,
  // _workshopBloc = workshopBloc,
        _createCustomerUsecase = createCustomerUsecase,
        super(RegisterState.initial()) {
    // on<LoadCoursesAndBatches>(_onRegisterEvent);
    on<RegisterCustomer>(_onRegisterUser);

    // add(LoadCoursesAndBatches());
  }

  void _onRegisterEvent(
      // LoadCoursesAndBatches event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(isLoading: true));
    // _batchBloc.add(LoadBatches());
    // _workshopBloc.add(LoadWorkshops());
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }

  Future<void> _onRegisterUser(
      RegisterCustomer event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));

    final params = CreateCustomerParams(
      name: event.name,
      username: event.username,
      phone: event.phone,
      email: event.email,
      password: event.password,
      image: event.image,

    );

    final result = await _createCustomerUsecase.call(params);

    result.fold(
            (failure) => emit(state.copyWith(isLoading: false, isSuccess: false)),
            (user) => emit(state.copyWith(isLoading: false, isSuccess: true)));
  }
}