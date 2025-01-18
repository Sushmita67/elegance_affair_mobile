import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  final String? customerId;
  final String fname;
  final String lname;
  final String? image;
  final String phone;
  final String username;
  final String password;

  const CustomerEntity({
    this.customerId,
    required this.fname,
    required this.lname,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [customerId, username];
}
