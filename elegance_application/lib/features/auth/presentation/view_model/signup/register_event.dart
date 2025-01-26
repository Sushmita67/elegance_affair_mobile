part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterCustomer extends RegisterEvent {
  final String name;
  final String username;
  final String phone;
  final String email;
  final String password;
  final String? image;

  const RegisterCustomer({
    required this.name,
    required this.username,
    required this.phone,
    required this.email,
    required this.password,
    this.image,
  });
}
