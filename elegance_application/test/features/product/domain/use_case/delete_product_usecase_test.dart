import 'package:dartz/dartz.dart';
import 'package:elegance_application/core/error/failure.dart';
import 'package:elegance_application/features/product/domain/use_case/delete_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../auth/domain/use_case/token.mock.dart';
import 'repository.mock.dart';

void main() {
  // Initialization
  late MockProductRepository repository;
  late MockTokenSharedPrefs sharedPrefs;
  late DeleteProductUseCase usecase;

  // Setup for Mocking Repository
  setUp(() {
    repository = MockProductRepository();
    sharedPrefs = MockTokenSharedPrefs();
    usecase = DeleteProductUseCase(
      productRepository: repository,
      tokenSharedPrefs: sharedPrefs,
    );
  });

  const tProductId = 'product1';
  const token = 'token';

  final deleteProductParams =
      DeleteProductParams(id: tProductId, productId: tProductId);

  test('should delete product using id successfully', () async {
    // Arrange
    when(() => sharedPrefs.getToken())
        .thenAnswer((_) async => const Right(token));

    when(() => repository.deleteProduct(any(), any()))
        .thenAnswer((_) async => const Right(null));

    // Act
    final result = await usecase(deleteProductParams);

    // Assert
    expect(result, const Right(null));

    // Verify
    verify(() => sharedPrefs.getToken()).called(1);
    verify(() => repository.deleteProduct(tProductId, token)).called(1);
    verifyNoMoreInteractions(sharedPrefs);
    verifyNoMoreInteractions(repository);
  });

  test('should return failure if product ID is not found', () async {
    // Arrange
    when(() => sharedPrefs.getToken())
        .thenAnswer((_) async => const Right(token));

    when(() => repository.deleteProduct(any(), any()))
        .thenAnswer((invocation) async {
      final id = invocation.positionalArguments[0] as String;

      if (id == tProductId) {
        return const Right(null);
      } else {
        return Left(ApiFailure(message: 'Product ID not found!'));
      }
    });

    final invalidProductParams =
        DeleteProductParams(id: 'wrong_id', productId: 'wrong_id');

    // Act
    final result = await usecase(invalidProductParams);

    // Assert
    expect(
        result,
        equals(Left(
            ApiFailure(message: 'Product ID not found!', statusCode: null))));

    // Verify
    verify(() => sharedPrefs.getToken()).called(1);
    verify(() => repository.deleteProduct('wrong_id', token)).called(1);
    verifyNoMoreInteractions(sharedPrefs);
    verifyNoMoreInteractions(repository);
  });
}
