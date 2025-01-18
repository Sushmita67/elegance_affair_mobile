// import 'package:elegance_application/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../auth/presentation/view/login_view.dart';

// class StartScreenCubit extends Cubit<void> {
//   StartScreenCubit(LoginBloc loginBloc) : super(null);

//   void navigateToLogin(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => LoginView(),
//       ),
//     );
//   }
// }

import 'package:elegance_application/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/view_model/login/login_bloc.dart';

class StartScreenCubit extends Cubit<void> {
  final LoginBloc loginBloc;

  StartScreenCubit({required this.loginBloc}) : super(null);

  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginView(),
      ),
    );
  }
}
