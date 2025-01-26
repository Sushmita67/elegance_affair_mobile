import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  final String? id;
  final String name;
  final String username;
  final String phone;
  final String email;
  final String password;
  final String? image;

  const CustomerEntity({
    this.id,
    required this.name,
    required this.username,
    required this.phone,
    required this.email,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props => [id, username, email];
}
