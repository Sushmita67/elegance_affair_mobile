import 'package:dartz/dartz.dart';
import 'package:elegance_application/features/product/domain/entity/product_entity.dart';
import 'package:elegance_application/features/product/domain/use_case/get_all_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'repository.mock.dart';

void main() {
  late MockProductRepository repository;
  late GetAllProductsUseCase usecase;

  setUp(() {
    repository = MockProductRepository();
    usecase = GetAllProductsUseCase(productRepository: repository);
  });

  final tProduct1 = ProductEntity(
    id: '1',
    title: 'Test Product 1',
    description: 'Test Description for Product 1',
    photo: 'IMG-1738569233151.jpg',
    price: 999,
  );

  final tProduct2 = ProductEntity(
    id: '2',
    title: 'Test Product 2',
    description: 'Test Description for Product 2',
    photo: 'IMG-1738569233151.jpg',
    price: 999,
  );
  final tProducts = [tProduct1, tProduct2];

  test('should call the [ProductRepo.getAllProducts]', () async {
    when(() => repository.getAllProducts()).thenAnswer(
      (_) async => Right(tProducts),
    );

    // Act
    final result = await usecase();
    // final result = Failure;

    // Assert
    expect(result, Right(tProducts));

    // Verify
    verify(() => repository.getAllProducts()).called(1);

    verifyNoMoreInteractions(repository);
  });
}
