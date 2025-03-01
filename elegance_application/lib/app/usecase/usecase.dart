import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';

abstract interface class UsecaseWithParams<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract class UsecaseWithoutParams<SuccessType> {
  Future<Either<Failure, SuccessType>> call();
}

