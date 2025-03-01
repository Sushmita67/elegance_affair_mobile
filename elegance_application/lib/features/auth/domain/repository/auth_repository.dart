import 'dart:io';

import 'package:elegance/core/error/failure.dart';
import 'package:elegance/features/auth/domain/entity/auth_entity.dart';
import 'package:elegance/features/auth/domain/use_case/login_usecase.dart';
import 'package:dartz/dartz.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerUser(AuthEntity user);
  Future<Either<Failure, AuthResponse>> loginUser(String userName, String password);
  Future<Either<Failure, AuthEntity>> getCurrentUser();
    Future<Either<Failure, String>> uploadProfilePicture(File file);
    Future<Either<Failure, void>> updateUser(String name, String email,int age, String phone);
}
