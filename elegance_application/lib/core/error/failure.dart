// abstract class Failure {
//   final String message;
//   final int? statusCode;

//   Failure({
//     required this.message,
//     this.statusCode,
//   });

//   @override
//   String toString() => 'Failure(message: $message, statusCode: $statusCode)';
// }

// class LocalDatabaseFailure extends Failure {
//   LocalDatabaseFailure({
//     required super.message,
//   });
// }

// class ApiFailure extends Failure {
//   final int? statusCode;

//   ApiFailure({
//     this.statusCode,
//     required super.message,
//   });
// }

// class SharedPrefsFailure extends Failure {
//   SharedPrefsFailure({
//     required super.message,
//   });
// }
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];

  @override
  String toString() => 'Failure(message: $message, statusCode: $statusCode)';
}

class LocalDatabaseFailure extends Failure {
  const LocalDatabaseFailure({required super.message});
}

class ApiFailure extends Failure {
  const ApiFailure({int? statusCode, required super.message})
      : super(statusCode: statusCode);
}

class SharedPrefsFailure extends Failure {
  const SharedPrefsFailure({required super.message});
}
