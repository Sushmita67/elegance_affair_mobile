// import 'package:elegance/features/onboarding/presentation/view/on_boarding_screen_view.dart';
// import 'package:elegance/features/onboarding/presentation/view_model/on_boarding_screen_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class SplashCubit extends Cubit<void> {
//   SplashCubit(this._onBoardingScreenCubit) : super(null);
//
//   final OnBoardingScreenCubit _onBoardingScreenCubit;
//
//   Future<void> init(BuildContext context) async {
//     await Future.delayed(const Duration(seconds: 2), () async {
//       if (context.mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => BlocProvider.value(
//               value: _onBoardingScreenCubit,
//               child:  OnboardingScreen(),
//             ),
//           ),
//         );
//       }
//     });
//   }
// }


import 'package:elegance/features/onboarding/presentation/view_model/on_boarding_screen_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/di.dart';
import '../../../onboarding/presentation/view/on_boarding_screen_view.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit(OnBoardingScreenCubit onBoardingScreenCubit) : super(null);

  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4), () async {
      // Ensure context is mounted before navigating
      if (context.mounted) {
        // Navigate to OnboardingView wrapped in BlocProvider
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              // Provide OnboardingCubit using getIt
              return BlocProvider<OnBoardingScreenCubit>(
                create: (_) => getIt<OnBoardingScreenCubit>(),
                // Ensure OnboardingCubit is available
                child: OnboardingScreen(), // Navigate to OnboardingView
              );
            },
          ),
        );
      }
    });
  }
}