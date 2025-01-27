import 'package:dartz/dartz.dart';

import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/user_entity.dart';
import '../repository/user_repository.dart';

class CreateUserParams extends Equatable {
  final String? id;
  final String name;
  final String username;
  final String phone;
  final String email;
  final String password;
  final String? image;

  const CreateUserParams({
    this.id,
    required this.name,
    required this.username,
    required this.phone,
    required this.email,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        username,
        password,
        image,
      ];
}

class CreateUserUsecase implements UsecaseWithParams<void, CreateUserParams> {
  final IUserRepository userRepository;

  const CreateUserUsecase({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(CreateUserParams params) async {
    // Create the user entity from the params
    final userEntity = UserEntity(
      id: null, // The ID will be generated automatically
      name: params.name,
      email: params.email,
      phone: params.phone,
      username: params.username,
      password: params.password,
      image: params.image,
    );

    // Call the repository method to create the user
    return await userRepository.createUser(userEntity);
  }
}
