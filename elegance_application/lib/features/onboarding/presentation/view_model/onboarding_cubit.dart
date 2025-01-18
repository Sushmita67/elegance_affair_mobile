import 'package:elegance_application/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/view_model/login/login_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  final LoginBloc loginBloc;

  OnboardingCubit({required this.loginBloc}) : super(0);

  final PageController pageController = PageController();

  void nextPage(BuildContext context, int totalSlides) {
    if (state < totalSlides - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(state + 1);
    } else {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ),
        );
      }
    }
  }

  void previousPage() {
    if (state > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(state - 1);
    }
  }

  void updatePage(int index) {
    emit(index);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  // Updated method to skip to the StartScreenView page
  void skipToLogin(BuildContext context) {
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginView(),
        ),
      );
    }
  }
}
