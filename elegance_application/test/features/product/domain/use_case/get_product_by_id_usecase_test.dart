import 'package:dartz/dartz.dart';
import 'package:elegance_application/core/error/failure.dart';
import 'package:elegance_application/features/product/domain/entity/product_entity.dart';
import 'package:elegance_application/features/product/domain/repository/product_repository.dart';
import 'package:elegance_application/features/product/domain/use_case/get_product_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'repository.mock.dart';

class MockProductRepository extends Mock implements IProductRepository {}

void main() {
  late MockProductRepository repository;
  late GetProductByIdUseCase usecase;

  setUp(() {
    repository = MockProductRepository();
    usecase = GetProductByIdUseCase(productRepository: repository);
  });

  setUpAll(() {
    registerFallbackValue('fallback_id');
  });

  final tProduct = ProductEntity(
    id: '1',
    title: 'Test Product',
    description: 'Test Description for Product',
    photo: 'IMG-1738569233151.jpg',
    price: 999,
  );

  final tProductId = '1';

  test('should call the [ProductRepo.getProductById] with the correct id',
      () async {
    // Arrange
    when(() => repository.getProductById(any())).thenAnswer(
      (_) async => Right(tProduct),
    );

    // Act
    final result =
        await usecase(GetProductByIdParams(id: '', productId: tProductId));

    // Assert
    expect(result, Right(tProduct));

    // Verify
    verify(() => repository.getProductById(tProductId)).called(1);

    verifyNoMoreInteractions(repository);
  });

  test('should return a failure when the repository fails to get product by id',
      () async {
    final tFailure = ApiFailure(message: 'API Failure');
    // Arrange
    when(() => repository.getProductById(any()))
        .thenAnswer((_) async => Left(tFailure));

    // Act
    final result =
        await usecase(GetProductByIdParams(productId: tProductId, id: ''));

    print("Test Failure Result: $result");

    // Assert
    expect(result, Left(tFailure));

    // verify
    verify(() => repository.getProductById(any())).called(1);
    verifyNoMoreInteractions(repository);
  });
}
