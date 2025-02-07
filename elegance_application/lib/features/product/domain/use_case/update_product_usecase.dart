// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';

// import '../../../../app/usecase/usecase.dart';
// import '../../../../core/error/failure.dart';
// import '../entity/product_entity.dart';
// import '../repository/product_repository.dart';

// class UpdateProductParams extends Equatable {
//   final ProductEntity product;
//   final String id;
//   final String productId;
//   final String title;
//   final double price;
//   final String description;
//   final String photo;

//   const UpdateProductParams({
//     required this.product,
//     required this.id,
//     required this.productId,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.photo,
//   });

//   @override
//   List<Object?> get props =>
//       [product, id, productId, title, price, description, photo];
// }

// class UpdateProductUseCase
//     implements UsecaseWithParams<void, UpdateProductParams> {
//   final IProductRepository productRepository;

//   UpdateProductUseCase({
//     required this.productRepository,
//     required tokenSharedPrefs,
//   });

//   @override
//   Future<Either<Failure, void>> call(UpdateProductParams params) async {
//     return productRepository.updateProduct(params.product, params.id);
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:elegance_application/app/shared_prefs/token_shared_prefs.dart';
import '../../../../core/error/failure.dart';
import '../entity/product_entity.dart';
import '../repository/product_repository.dart';

class UpdateProductParams {
  final String id;
  final String title;
  final String description;
  final String photo;
  final double price;
  final String productId;
  final ProductEntity product;

  UpdateProductParams({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.price,
    required this.productId,
    required this.product,
  });
}

class UpdateProductUseCase {
  final IProductRepository productRepository;
  final TokenSharedPrefs tokenSharedPrefs;

  UpdateProductUseCase({
    required this.productRepository,
    required this.tokenSharedPrefs,
  });

  Future<Either<Failure, void>> call(UpdateProductParams params) async {
    final tokenResult = await tokenSharedPrefs.getToken();

    // Debugging print
    print("Token result: $tokenResult");

    return tokenResult.fold(
      (failure) => Left(failure),
      (token) async {
        print("Calling repository.updateProduct with: ${params.product}");
        return productRepository.updateProduct(params.product, token);
      },
    );
  }
}
