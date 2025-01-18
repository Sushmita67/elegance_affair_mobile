part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

// Event to load courses and batches
class LoadCoursesAndBatches extends RegisterEvent {}

// Event to handle registering a customer
class RegisterCustomer extends RegisterEvent {
  final String fName;
  final String lName;
  final String phone;
  final String username;
  final String password;

  const RegisterCustomer({
    required this.fName,
    required this.lName,
    required this.phone,
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [
        fName,
        lName,
        phone,
        username,
        password,
      ];
}
