import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:elegance_application/core/error/failure.dart';
import 'package:elegance_application/features/product/domain/entity/product_entity.dart';
import 'package:elegance_application/features/product/domain/use_case/update_product_usecase.dart';

import '../../../auth/domain/use_case/token.mock.dart';
import 'repository.mock.dart';

void main() {
  late MockProductRepository repository;
  late MockTokenSharedPrefs sharedPrefs;
  late UpdateProductUseCase usecase;

  setUp(() {
    repository = MockProductRepository();
    sharedPrefs = MockTokenSharedPrefs();
    usecase = UpdateProductUseCase(
      productRepository: repository,
      tokenSharedPrefs: sharedPrefs,
    );

    registerFallbackValue(ProductEntity(
      id: 'fallback_id',
      title: 'Fallback Product',
      description: 'Fallback Description',
      photo: 'fallback_photo.jpg',
      price: 999,
    ));
  });

  final tProductEntity = ProductEntity(
    id: '1',
    title: 'Updated Product',
    description: 'Updated Description',
    photo: 'updated_photo.jpg',
    price: 999,
  );

  final tParams = UpdateProductParams(
    id: '1',
    title: tProductEntity.title,
    description: '',
    photo: '',
    price: tProductEntity.price,
    productId: 'someProductId',
    product: tProductEntity,
  );

  const token = 'token';

  test('should update product successfully', () async {
    // Arrange
    when(() => sharedPrefs.getToken()).thenAnswer((_) async => Right(token));

    when(() => repository.updateProduct(any(), any()))
        .thenAnswer((_) async => Right(null));

    // Act
    final result = await usecase(tParams);

    // Debugging Print
    print("Test Success Result: $result");

    // Assert
    expect(result, Right(null));

    // Verify
    verify(() => sharedPrefs.getToken()).called(1);
    verify(() => repository.updateProduct(any(), token)).called(1);
    verifyNoMoreInteractions(sharedPrefs);
    verifyNoMoreInteractions(repository);
  });

  test('should return failure when repository fails', () async {
    // Arrange
    when(() => sharedPrefs.getToken()).thenAnswer((_) async => Right(token));

    when(() => repository.updateProduct(any(), any()))
        .thenAnswer((_) async => Left(ApiFailure(message: 'Update failed')));

    // Act
    final result = await usecase(tParams);

    // Debugging Print
    print("Test Failure Result: $result");

    // Assert
    expect(result.fold((l) => l.message, (r) => null), 'Update failed');

    // Verify
    verify(() => sharedPrefs.getToken()).called(1);
    verify(() => repository.updateProduct(any(), token)).called(1);
    verifyNoMoreInteractions(sharedPrefs);
    verifyNoMoreInteractions(repository);
  });

  test('should return failure when token retrieval fails', () async {
    // Arrange
    when(() => sharedPrefs.getToken())
        .thenAnswer((_) async => Left(ApiFailure(message: 'No token found')));

    // Act
    final result = await usecase(tParams);

    // Debugging Print
    print("Test Token Failure Result: $result");

    // Assert
    expect(result.fold((l) => l.message, (r) => null), 'No token found');

    // Verify
    verify(() => sharedPrefs.getToken()).called(1);
    verifyNoMoreInteractions(sharedPrefs);
    verifyNoMoreInteractions(repository);
  });
}
