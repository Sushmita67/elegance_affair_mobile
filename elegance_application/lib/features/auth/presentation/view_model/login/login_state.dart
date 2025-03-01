//
//
// part of 'login_bloc.dart';
//
// class LoginState extends Equatable {
//   final bool isLoading;
//   final bool isSuccess;
//   final bool isPasswordVisible;
//
//   const LoginState({
//     required this.isLoading,
//     required this.isSuccess,
//     required this.isPasswordVisible,
//   });
//
//   factory LoginState.initial() {
//     return const LoginState(
//       isLoading: false,
//       isSuccess: false,
//       isPasswordVisible: false,
//     );
//   }
//
//   LoginState copyWith({
//     bool? isLoading,
//     bool? isSuccess,
//     bool? isPasswordVisible,
//   }) {
//     return LoginState(
//       isLoading: isLoading ?? this.isLoading,
//       isSuccess: isSuccess ?? this.isSuccess,
//       isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
//     );
//   }
//
//   @override
//   List<Object> get props => [isLoading, isSuccess, isPasswordVisible];
// }

part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isPasswordVisible;

  const LoginState({
    required this.isLoading,
    required this.isSuccess,
    required this.isPasswordVisible,
  });

  factory LoginState.initial() {
    return const LoginState(
      isLoading: false,
      isSuccess: false,
      isPasswordVisible: false,
    );
  }

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isPasswordVisible,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object> get props => [isLoading, isSuccess, isPasswordVisible];
}


