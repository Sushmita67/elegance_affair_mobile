// part of 'login_bloc.dart';
//
// abstract class LoginEvent extends Equatable {
//   const LoginEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// class LoginSubmittedEvent extends LoginEvent {
//   final String email;
//   final BuildContext context;
//   final String password;
//   final Function(Widget destination) onSuccess;
//   final Function(String errorMessage) onFailure;
//
//   const LoginSubmittedEvent({
//     required this.context,
//     required this.email,
//     required this.password,
//     required this.onSuccess,
//     required this.onFailure,
//   });
// }
//
// class NavigateRegisterEvent extends LoginEvent {
//   final Function() onNavigate;
//
//   const NavigateRegisterEvent({required this.onNavigate});
// }
//
// class NavigateForgotPasswordEvent extends LoginEvent {
//   final Function() onNavigate;
//
//   const NavigateForgotPasswordEvent({required this.onNavigate});
// }
//
// class NavigateHomeScreenEvent extends LoginEvent {
//   final BuildContext context;
//   final Widget destination;
//
//   const NavigateHomeScreenEvent({
//     required this.context,
//     required this.destination,
//   });
// }
//
// class TogglePasswordVisibilityEvent extends LoginEvent {}

part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final BuildContext context;
  final String password;
  final Function(Widget destination) onSuccess;
  final Function(String errorMessage) onFailure;

  const LoginSubmittedEvent({
    required this.context,
    required this.email,
    required this.password,
    required this.onSuccess,
    required this.onFailure,
  });
}

class NavigateRegisterEvent extends LoginEvent {
  final Function() onNavigate;

  const NavigateRegisterEvent({required this.onNavigate});
}

class NavigateForgotPasswordEvent extends LoginEvent {
  final Function() onNavigate;

  const NavigateForgotPasswordEvent({required this.onNavigate});
}

class NavigateHomeScreenEvent extends LoginEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateHomeScreenEvent({
    required this.context,
    required this.destination,
  });
}

// ✅ Password Visibility Toggle Event
class TogglePasswordVisibilityEvent extends LoginEvent {}

