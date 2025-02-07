// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:elegance_application/core/error/failure.dart';
// import 'package:elegance_application/features/product/domain/entity/product_entity.dart';
// import 'package:elegance_application/features/product/domain/use_case/create_product_usecase.dart';
// import 'package:elegance_application/features/product/domain/use_case/delete_product_usecase.dart';
// import 'package:elegance_application/features/product/domain/use_case/get_all_product_usecase.dart';
// import 'package:elegance_application/features/product/domain/use_case/update_product_usecase.dart';
// import 'package:elegance_application/features/product/presentation/view_model/product_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// class MockCreateProductUseCase extends Mock implements CreateProductUseCase {}

// class MockGetAllProductsUseCase extends Mock implements GetAllProductsUseCase {}

// class MockDeleteProductUseCase extends Mock implements DeleteProductUseCase {}

// class MockUpdateProductUseCase extends Mock implements UpdateProductUseCase {}

// void main() {
//   late MockCreateProductUseCase createProductUseCase;
//   late MockGetAllProductsUseCase getAllProductsUseCase;
//   late MockDeleteProductUseCase deleteProductUseCase;
//   late MockUpdateProductUseCase updateProductUseCase;
//   late ProductBloc productBloc;

//   setUp(() {
//     createProductUseCase = MockCreateProductUseCase();
//     getAllProductsUseCase = MockGetAllProductsUseCase();
//     deleteProductUseCase = MockDeleteProductUseCase();
//     updateProductUseCase = MockUpdateProductUseCase();

//     productBloc = ProductBloc(
//       createProductUseCase: createProductUseCase,
//       getAllProductsUseCase: getAllProductsUseCase,
//       deleteProductUseCase: deleteProductUseCase,
//       updateProductUseCase: updateProductUseCase,
//     );
//   });

//   tearDown(() {
//     productBloc.close();
//   });

//   group('Product Bloc', () {
//     final product1 = ProductEntity(id: '1', title: 'Product 1', price: 999);
//     final product2 = ProductEntity(id: '2', title: 'Product 2', price: 999);
//     final lstProducts = [product1, product2];

//     blocTest<ProductBloc, ProductState>(
//       'emits [ProductState] when LoadProducts is added',
//       build: () {
//         when(() => getAllProductsUseCase.call())
//             .thenAnswer((_) async => Right(lstProducts));
//         return productBloc;
//       },
//       act: (bloc) => bloc.add(LoadProducts()),
//       expect: () => [
//         ProductState.initial().copyWith(isLoading: true),
//         ProductState.initial()
//             .copyWith(isLoading: false, products: lstProducts),
//       ],
//       verify: (_) {
//         verify(() => getAllProductsUseCase.call()).called(1);
//       },
//     );
//     blocTest<ProductBloc, ProductState>(
//       'emits [ProductState] with loaded products is added with skip 1',
//       build: () {
//         when(() => getAllProductsUseCase.call())
//             .thenAnswer((_) async => Right(lstProducts));
//         return productBloc;
//       },
//       act: (bloc) => bloc.add(LoadProducts()),
//       skip: 1,
//       expect: () => [
//         ProductState.initial()
//             .copyWith(isLoading: false, products: lstProducts),
//       ],
//       verify: (_) {
//         verify(() => getAllProductsUseCase.call()).called(1);
//       },
//     );

//     blocTest<ProductBloc, ProductState>(
//       'emits [ProductState] with error when LoadProducts fails',
//       build: () {
//         when(() => getAllProductsUseCase.call())
//             .thenAnswer((_) async => Left(ApiFailure(message: 'Error')));
//         return productBloc;
//       },
//       act: (bloc) => bloc.add(LoadProducts()),
//       expect: () => [
//         ProductState.initial().copyWith(isLoading: true),
//         ProductState.initial().copyWith(isLoading: false, error: 'Error'),
//       ],
//       verify: (_) {
//         verify(() => getAllProductsUseCase.call()).called(1);
//       },
//     );
//   });
// }

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:elegance_application/core/error/failure.dart';
import 'package:elegance_application/features/product/domain/entity/product_entity.dart';
import 'package:elegance_application/features/product/domain/use_case/create_product_usecase.dart';
import 'package:elegance_application/features/product/domain/use_case/delete_product_usecase.dart';
import 'package:elegance_application/features/product/domain/use_case/get_all_product_usecase.dart';
import 'package:elegance_application/features/product/domain/use_case/update_product_usecase.dart';
import 'package:elegance_application/features/product/presentation/view_model/product_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock UseCases
class MockCreateProductUseCase extends Mock implements CreateProductUseCase {}

class MockGetAllProductsUseCase extends Mock implements GetAllProductsUseCase {}

class MockDeleteProductUseCase extends Mock implements DeleteProductUseCase {}

class MockUpdateProductUseCase extends Mock implements UpdateProductUseCase {}

void main() {
  late MockCreateProductUseCase createProductUseCase;
  late MockGetAllProductsUseCase getAllProductsUseCase;
  late MockDeleteProductUseCase deleteProductUseCase;
  late MockUpdateProductUseCase updateProductUseCase;
  late ProductBloc productBloc;

  setUp(() {
    createProductUseCase = MockCreateProductUseCase();
    getAllProductsUseCase = MockGetAllProductsUseCase();
    deleteProductUseCase = MockDeleteProductUseCase();
    updateProductUseCase = MockUpdateProductUseCase();

    productBloc = ProductBloc(
      createProductUseCase: createProductUseCase,
      getAllProductsUseCase: getAllProductsUseCase,
      deleteProductUseCase: deleteProductUseCase,
      updateProductUseCase: updateProductUseCase,
    );
  });

  tearDown(() {
    productBloc.close();
  });

  group('Product Bloc', () {
    final product1 = ProductEntity(id: '1', title: 'Product 1', price: 999);
    final product2 = ProductEntity(id: '2', title: 'Product 2', price: 999);
    final lstProducts = [product1, product2];

    blocTest<ProductBloc, ProductState>(
      'emits [ProductState] when LoadProducts is added',
      build: () {
        // Mocking the call properly
        when(() => getAllProductsUseCase.call())
            .thenAnswer((_) async => Right(lstProducts));
        return productBloc;
      },
      act: (bloc) async {
        // Add the event and wait for the results
        bloc.add(LoadProducts());
        await Future.delayed(Duration.zero); // Ensure async gaps are handled
      },
      expect: () => [
        ProductState.initial().copyWith(isLoading: true),
        ProductState.initial()
            .copyWith(isLoading: false, products: lstProducts),
      ],
      verify: (_) {
        verify(() => getAllProductsUseCase.call()).called(1);
      },
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductState] with loaded products when skip 1 is applied',
      build: () {
        when(() => getAllProductsUseCase.call())
            .thenAnswer((_) async => Right(lstProducts));
        return productBloc;
      },
      act: (bloc) => bloc.add(LoadProducts()),
      skip: 1,
      expect: () => [
        // Skipping the first state and expect the final one
        ProductState.initial()
            .copyWith(isLoading: false, products: lstProducts),
      ],
      verify: (_) {
        verify(() => getAllProductsUseCase.call()).called(1);
      },
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductState] with error when LoadProducts fails',
      build: () {
        when(() => getAllProductsUseCase.call())
            .thenAnswer((_) async => Left(ApiFailure(message: 'Error')));
        return productBloc;
      },
      act: (bloc) => bloc.add(LoadProducts()),
      expect: () => [
        // Expecting the first state with isLoading: true
        ProductState.initial().copyWith(isLoading: true),
        // Then, expect the state to have isLoading: false and an error message
        ProductState.initial().copyWith(isLoading: false, error: 'Error'),
      ],
      verify: (_) {
        verify(() => getAllProductsUseCase.call()).called(1);
      },
    );
  });
}
