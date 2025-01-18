import 'package:elegance_application/features/home/presentation/view_model/home_cubit.dart';
import 'package:elegance_application/features/start_screen/presentation/view/start_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/view_model/login/login_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  final LoginBloc loginBloc;

  OnboardingCubit(HomeCubit homeCubit, {required this.loginBloc}) : super(0);

  final PageController pageController = PageController();
  // Updated method to skip to the StartScreenView page
  void skipToStartScreen(BuildContext context) {
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StartScreenView(),
        ),
      );
    }
  }
}
