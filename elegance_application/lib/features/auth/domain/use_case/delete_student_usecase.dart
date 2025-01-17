import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/student_repository.dart';

class DeleteStudentParams extends Equatable {
  final String studentId;

  const DeleteStudentParams({required this.studentId});

  const DeleteStudentParams.empty() : studentId = "_empty.string";

  @override
  List<Object?> get props => [studentId];
}

class DeleteStudentUsecase implements UsecaseWithParams<void, DeleteStudentParams> {
  final IStudentRepository studentRepository;

  const DeleteStudentUsecase({required this.studentRepository});

  @override
  Future<Either<Failure, void>> call(DeleteStudentParams params) async {
    return await studentRepository.deleteStudent(params.studentId);
  }
}