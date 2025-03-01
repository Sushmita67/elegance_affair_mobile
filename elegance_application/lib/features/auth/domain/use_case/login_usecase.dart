import 'package:elegance/app/shared_prefs/token_shared_prefs.dart';
import 'package:elegance/app/shared_prefs/user_shared_prefs.dart';
import 'package:elegance/app/usecase/usecase.dart';
import 'package:elegance/core/error/failure.dart';
import 'package:elegance/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  const LoginParams.initial()
      : email = '',
        password = '';

  @override
  List<Object?> get props => [email, password];
}

class AuthResponse extends Equatable {
  final String token;
  final String userId;

  const AuthResponse({
    required this.token,
    required this.userId,
  });

  @override
  List<Object?> get props => [token, userId];
}

class LoginUseCase implements UsecaseWithParams<AuthResponse, LoginParams> {
  final IAuthRepository repository;
  final TokenSharedPrefs tokenSharedPrefs;
  final UserSharedPrefs userSharedPrefs;

  LoginUseCase(this.repository, this.tokenSharedPrefs, this.userSharedPrefs);

  @override
  Future<Either<Failure, AuthResponse>> call(LoginParams params) {
    return repository.loginUser(params.email, params.password).then((value) {
      return value.fold(
        (failure) => Left(failure),
        (authResponse) {
          // tokenSharedPrefs.saveToken(token);
          tokenSharedPrefs.saveToken(authResponse.token);
          print('authResponse.userId: ${authResponse.userId}');
          userSharedPrefs.saveUserId(authResponse.userId);
          return Right(AuthResponse(token: authResponse.token, userId: authResponse.userId));
        },
      );
    });
  }
}
