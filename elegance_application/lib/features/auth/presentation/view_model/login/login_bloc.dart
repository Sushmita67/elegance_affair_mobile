import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/view_model/home_cubit.dart';
import '../../../domain/use_case/login_student_usecase.dart';
import '../signup/register_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegisterBloc _registerBloc;
  final HomeCubit _homeCubit;

  final LoginStudentUsecase _loginStudentUsecase;

  LoginBloc({
    required RegisterBloc registerBloc,
    required HomeCubit homeCubit,

    required LoginStudentUsecase loginStudentUsecase,
  })  : _registerBloc = registerBloc,
        _homeCubit = homeCubit,
        _loginStudentUsecase = loginStudentUsecase,
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
    on<LoginStudentEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final params = LoginStudentParams(
        username: event.username,
        password: event.password,
      );

      final result = await _loginStudentUsecase.call(params);

      result.fold(
        (failure) {
          // Handle failure (update the state with error message or show a failure alert)
          emit(state.copyWith(isLoading: false, isSuccess: false));
        },
        (student) {
          // On success, update state and navigate to the home screen
          emit(state.copyWith(isLoading: false, isSuccess: true));
        },
      );
    });
  }
}
