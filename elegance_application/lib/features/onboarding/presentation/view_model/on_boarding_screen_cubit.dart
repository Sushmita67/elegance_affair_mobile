// import 'package:elegance/features/auth/presentation/view/login_screen_view.dart';
// import 'package:elegance/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class OnBoardingScreenCubit extends Cubit<void> {
//   final LoginBloc _loginBloc;
//   OnBoardingScreenCubit({required LoginBloc loginBloc})
//       : _loginBloc = loginBloc,
//         super(null);
//
//   void navigateToLogin(BuildContext context) {
//     if (context.mounted) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//             value: _loginBloc,
//             child: LoginScreenView(),
//           ),
//         ),
//       );
//     }
//   }
// }


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/view/login_screen_view.dart';
import '../../../auth/presentation/view_model/login/login_bloc.dart';

class OnBoardingScreenCubit extends Cubit<void> {
  OnBoardingScreenCubit({required LoginBloc loginBloc})
      : _loginBloc = loginBloc,
        super(null);

  final LoginBloc _loginBloc;

  Future<void> goToLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1), () async {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _loginBloc,
              child: LoginScreenView(),
            ),
          ),
        );
      }
    });
  }
}