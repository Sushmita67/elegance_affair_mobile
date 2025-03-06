// import 'package:elegance/core/common/logo_common.dart';
// import 'package:elegance/features/splash/presentation/view_model/splash_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class SplashScreenView extends StatefulWidget {
//   const SplashScreenView({super.key});
//
//   @override
//   State<SplashScreenView> createState() => _SplashScreenViewState();
// }
//
// class _SplashScreenViewState extends State<SplashScreenView> {
//   @override
//   void initState() {
//     context.read<SplashCubit>().init(context);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: Logo(
//             height: 500,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../view_model/splash_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/loading.json',
                height: 200,
                repeat: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

