import 'package:dartz/dartz.dart';
import 'package:elegance_application/core/error/failure.dart';
import 'package:elegance_application/features/product/domain/entity/product_entity.dart';
import 'package:elegance_application/features/product/domain/use_case/create_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'repository.mock.dart';

// ✅ Create a Fake class for CreateProductParams
class FakeCreateProductParams extends Fake implements CreateProductParams {}

void main() {
  // Initialization
  late MockProductRepository repository;
  late CreateProductUseCase usecase;

  // ✅ Set up fake values before all tests
  setUpAll(() {
    registerFallbackValue(FakeCreateProductParams()); // Fake params
    registerFallbackValue(ProductEntity(
      id: '1',
      title: 'Test Product',
      description: 'Test Description',
      photo: 'test.jpg',
      price: 100.0,
    )); // Fake ProductEntity
  });

  setUp(() {
    repository = MockProductRepository();
    usecase = CreateProductUseCase(productRepository: repository);
  });

  // ✅ Ensure CreateProductParams.empty() is valid
  final params = CreateProductParams(
    title: 'Test Product',
    description: 'Test Description',
    photo: 'test.jpg',
    price: 100.0,
    productId: '',
  );

  test('should call the [ProductRepo.createProduct] successfully', () async {
    // Arrange: Mock the repository response
    when(() => repository.createProduct(any())).thenAnswer(
      (_) async => const Right(null),
    );

    // Act: Call the use case
    final result = await usecase(params);

    // Assert: Check the result
    expect(result, const Right(null));

    // Verify interactions
    verify(() => repository.createProduct(any())).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return a failure when repository fails', () async {
    // Arrange: Mock failure response
    final failure = ApiFailure(message: 'API Failure');
    when(() => repository.createProduct(any())).thenAnswer(
      (_) async => Left(failure),
    );

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, Left(failure));

    // Verify interactions
    verify(() => repository.createProduct(any())).called(1);
    verifyNoMoreInteractions(repository);
  });
}
