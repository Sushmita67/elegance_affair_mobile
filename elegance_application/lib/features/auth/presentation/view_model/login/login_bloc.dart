import 'package:elegance_application/features/auth/domain/use_case/login_customer_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/view_model/home_cubit.dart';
import '../signup/register_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegisterBloc _registerBloc;
  final HomeCubit _homeCubit;

  final LoginCustomerUsecase _loginCustomerUsecase;

  LoginBloc({
    required RegisterBloc registerBloc,
    required HomeCubit homeCubit,
    required LoginCustomerUsecase loginCustomerUsecase,
  })  : _registerBloc = registerBloc,
        _homeCubit = homeCubit,
        _loginCustomerUsecase = loginCustomerUsecase,
        super(LoginState.initial()) {
    on<NavigateRegisterScreenEvent>((event, emit) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _registerBloc),
            ],
            child: event.destination,
          ),
        ),
      );
    });

    on<NavigateHomeScreenEvent>((event, emit) {
      Navigator.pushReplacement(
        event.context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _homeCubit,
            child: event.destination,
          ),
        ),
      );
    });

    // Handle login event
    on<LoginCustomerEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final params = LoginCustomerParams(
        username: event.username,
        password: event.password,
      );

      final result = await _loginCustomerUsecase.call(params);

      result.fold(
        (failure) {
          // Handle failure (update the state with error message or show a failure alert)
          emit(state.copyWith(isLoading: false, isSuccess: false));
        },
        (customer) {
          // On success, update state and navigate to the home screen
          emit(state.copyWith(isLoading: false, isSuccess: true));
        },
      );
    });
  }
}
