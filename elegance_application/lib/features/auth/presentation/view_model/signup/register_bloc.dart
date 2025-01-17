import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_case/create_student_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  final CreateStudentUsecase _createStudentUsecase;

  RegisterBloc({

    required CreateStudentUsecase createStudentUsecase,
  })  : _createStudentUsecase = createStudentUsecase,
        super(RegisterState.initial()) {
    // on<LoadCoursesAndBatches>(_onRegisterEvent);
    on<RegisterStudent>(_onRegisterStudent);

    // add(LoadCoursesAndBatches());
  }

  // void _onRegisterEvent(
  //   LoadCoursesAndBatches event,
  //   Emitter<RegisterState> emit,
  // ) {
  //   emit(state.copyWith(isLoading: true));
  //   emit(state.copyWith(isLoading: false, isSuccess: true));
  // }

  Future<void> _onRegisterStudent(
      RegisterStudent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));

    final params = CreateStudentParams(
      fName: event.fName,
      lName: event.lName,
      phone: event.phone,
      username: event.username,
      password: event.password,
    );

    final result = await _createStudentUsecase.call(params);

    result.fold(
        (failure) => emit(state.copyWith(isLoading: false, isSuccess: false)),
        (student) => emit(state.copyWith(isLoading: false, isSuccess: true)));
  }
}
