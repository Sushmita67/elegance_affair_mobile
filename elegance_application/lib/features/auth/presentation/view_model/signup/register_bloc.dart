import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_case/create_user_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';



class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  final CreateUserUsecase _createUserUsecase;

  RegisterBloc({
    required CreateUserUsecase createUserUsecase,
  })  :

        _createUserUsecase = createUserUsecase,
        super(RegisterState.initial()) {

    on<RegisterUser>(_onRegisterUser);

  }

  void _onRegisterEvent(

      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(isLoading: true));

    emit(state.copyWith(isLoading: false, isSuccess: true));
  }

  Future<void> _onRegisterUser(
      RegisterUser event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));

    final params = CreateUserParams(
      name: event.name,
      username: event.username,
      phone: event.phone,
      email: event.email,
      password: event.password,
      image: event.image,

    );

    final result = await _createUserUsecase.call(params);

    result.fold(
          (failure) {
        addError(failure); // Log error if needed
        emit(state.copyWith(isLoading: false, isSuccess: false));
      },
          (user) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      },
    );
  }
}