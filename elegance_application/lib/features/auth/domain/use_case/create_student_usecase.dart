import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/student_entity.dart';
import '../repository/student_repository.dart';

class CreateStudentParams extends Equatable {
  final String fName;
  final String lName;
  final String phone;
  final String username;
  final String password;
  final String? image;


  const CreateStudentParams({
    required this.fName,
    required this.lName,
    required this.phone,
    required this.username,
    required this.password,
    this.image,

  });

  @override
  List<Object?> get props => [
        fName,
        lName,
        phone,
        username,
        password,
        image,

      ];
}

class CreateStudentUsecase implements UsecaseWithParams<void, CreateStudentParams> {
  final IStudentRepository studentRepository;

  const CreateStudentUsecase({required this.studentRepository});

  @override
  Future<Either<Failure, void>> call(CreateStudentParams params) async {
    // Create the student entity from the params
    final studentEntity = StudentEntity(
      studentId: null, // The ID will be generated automatically
      fname: params.fName,
      lname: params.lName,
      phone: params.phone,
      username: params.username,
      password: params.password,
      image: params.image,
    );

    // Call the repository method to create the student
    return await studentRepository.createStudent(studentEntity);
  }
}