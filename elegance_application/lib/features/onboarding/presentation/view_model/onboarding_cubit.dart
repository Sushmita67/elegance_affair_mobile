import 'package:elegance_application/features/auth/presentation/view/login_view.dart';
import 'package:elegance_application/features/home/presentation/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/view_model/login/login_bloc.dart';

// class OnboardingCubit extends Cubit<int> {
//   final LoginBloc loginBloc;
//
//   OnboardingCubit(HomeCubit homeCubit, {required this.loginBloc}) : super(0);
//
//   final PageController pageController = PageController();
//   // Updated method to skip to the StartScreenView page
//   void skipToLoginPage(BuildContext context) {
//     if (context.mounted) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => LoginView(),
//         ),
//       );
//     }
//   }
// }

class OnboardingCubit extends Cubit<void> {
  OnboardingCubit(this._loginBloc) : super(null);

  final LoginBloc _loginBloc;

  Future<void> goToLogin(BuildContext context) async {
    // Add any delay if necessary
    await Future.delayed(const Duration(seconds: 1), () async {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _loginBloc,
              child: LoginView(),
            ),
          ),
        );
      }
    });
  }
}

