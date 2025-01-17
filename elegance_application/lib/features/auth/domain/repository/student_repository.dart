import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/student_entity.dart';

abstract interface class IStudentRepository {
  Future<Either<Failure, void>> createStudent(StudentEntity studentEntity);
  Future<Either<Failure, List<StudentEntity>>> getAllStudentes();
  Future<Either<Failure, void>> deleteStudent(String id);
  Future<Either<Failure, StudentEntity>> login(
      String username, String password);
}
