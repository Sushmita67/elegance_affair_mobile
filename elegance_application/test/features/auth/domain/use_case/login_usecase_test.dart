import 'package:elegance/core/error/failure.dart';
import 'package:elegance/features/auth/domain/use_case/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authrepository.mock.dart';
import 'token.mock.dart';
import 'user.mock.dart';

// flutter test --coverage
// flutter test .\test\features\auth\domain\use_case\ --coverage
// flutter pub run test_cov_console

void main() {
  late MockTokenSharedPrefs tokenSharedPrefs;
  late MockUserSharedPrefs userSharedPrefs;
  late MockAuthRepository repository;
  late LoginUseCase usecase;

  setUp(() {
    repository = MockAuthRepository();
    tokenSharedPrefs = MockTokenSharedPrefs();
    userSharedPrefs = MockUserSharedPrefs();
    usecase = LoginUseCase(repository, tokenSharedPrefs, userSharedPrefs);
  });

  // test(
  //     'should call the [AuthRepo.login] with correct username and password[sushmita, sushmita123]',
  //     () async {
  //   when(() => repository.loginUser(any(), any())).thenAnswer(
  //     (invocation) async {
  //       final username = invocation.positionalArguments[0] as String;
  //       final password = invocation.positionalArguments[1] as String;
  //       if (username == 'sushmita' && password == 'sush123') {
  //         return Future.value(
  //             const Right(AuthResponse(token: 'token', userId: 'Sush')));
  //       } else {
  //         return Future.value(
  //             const Left(ApiFailure(message: 'Invalid username and password')));
  //       }
  //     },
  //   );
  //   when(() => tokenSharedPrefs.saveToken(any())).thenAnswer(
  //     (_) async => const Right(null),
  //   );
  //   when(() => userSharedPrefs.saveUserId(any())).thenAnswer(
  //     (_) async => const Right(null),
  //   );
  //
  //   final result = await usecase(const LoginParams(
  //     email: 'sush',
  //     password: 'sush123',
  //   ));
  //
  //   expect(
  //     result,
  //     const Right(AuthResponse(token: 'token', userId: 'Sush')),
  //   );
  //   verify(() => repository.loginUser(any(), any())).called(1);
  //   verify(() => tokenSharedPrefs.saveToken('token')).called(1);
  //   verify(() => userSharedPrefs.saveUserId('Sushmita')).called(1);
  //
  //   verifyNoMoreInteractions(repository);
  //   verifyNoMoreInteractions(tokenSharedPrefs);
  //   verifyNoMoreInteractions(userSharedPrefs);
  // });
  // tearDown(() {
  //   reset(repository);
  //   reset(tokenSharedPrefs);
  //   reset(userSharedPrefs);
  // });
}
