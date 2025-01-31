import 'package:elegance_application/features/onboarding/presentation/view/onboarding_screen_view.dart';
import 'package:elegance_application/features/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/di.dart';

// class SplashCubit extends Cubit<void> {
//   SplashCubit(this._onboardingCubit) : super(null);

//   final OnboardingCubit _onboardingCubit;
//
//   Future<void> init(BuildContext context) async {
//     await Future.delayed(const Duration(seconds: 3), () async {
//       if (context.mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => BlocProvider.value(
//               value: _onboardingCubit,
//               child: OnboardingScreenView(),
//             ),
//           ),
//         );
//       }
//     });
//   }
// }


class SplashCubit extends Cubit<void> {
  SplashCubit() : super(null);

  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () async {
      // Ensure context is mounted before navigating
      if (context.mounted) {
        // Navigate to OnboardingView wrapped in BlocProvider
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              // Provide OnboardingCubit using getIt
              return BlocProvider<OnboardingCubit>(
                create: (_) => getIt<OnboardingCubit>(),
                // Ensure OnboardingCubit is available
                child: OnboardingView(), // Navigate to OnboardingView
              );
            },
          ),
        );
      }
    });
  }
}