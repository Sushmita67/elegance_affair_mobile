// import 'package:elegance_application/app/di/di.dart';
// import 'package:elegance_application/features/auth/presentation/view/login_view.dart';
// import 'package:elegance_application/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:elegance_application/features/start_screen/presentation/view_model/start_screen_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';

// class StartScreenView extends StatelessWidget {
//   const StartScreenView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => getIt<StartScreenCubit>(),
//       child: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/bg.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: BlocBuilder<StartScreenCubit, void>(
//             builder: (context, state) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   // Logo Container
//                   Container(
//                     width: double.infinity,
//                     color: const Color.fromARGB(255, 255, 255, 255),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20.0),
//                       child: Center(
//                         child: Image.asset(
//                           'assets/icons/elegance_affair.png',
//                           height: 90,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   // Tagline
//                   Text(
//                     "Timeless jewelry, personalized for you",
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.greatVibes(
//                       fontSize: 26,
//                       fontStyle: FontStyle.italic,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 390),
//                   // Main Heading
//                   Text(
//                     "Discover   Timeless\n Elegance  At  Our \n Jewelers💍✨🛍️",
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.playfairDisplaySc(
//                       fontSize: 33,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   // Start Button
//                   ElevatedButton(
//                     onPressed: () {
//                       context.read<LoginBloc>().add(
//                             NavigateRegisterScreenEvent(
//                               destination: LoginView(),
//                               context: context,
//                             ),
//                           );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 30,
//                         vertical: 15,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     child: const Text(
//                       "Get Started",
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                   const Spacer(),
//                   // Footer Text
//                   Text(
//                     "Sparkle effortlessly with us.",
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.montserratAlternates(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 110),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:elegance_application/app/di/di.dart';
import 'package:elegance_application/features/auth/presentation/view/login_view.dart';
import 'package:elegance_application/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:elegance_application/features/start_screen/presentation/view_model/start_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreenView extends StatelessWidget {
  const StartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StartScreenCubit>(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<StartScreenCubit, void>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Logo Container
                  Container(
                    width: double.infinity,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Image.asset(
                          'assets/icons/elegance_affair.png',
                          height: 90,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Tagline
                  Text(
                    "Timeless jewelry, personalized for you",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.greatVibes(
                      fontSize: 26,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 390),
                  // Main Heading
                  Text(
                    "Discover   Timeless\n Elegance  At  Our \n Jewelers💍✨🛍️",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplaySc(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Start Button
                  ElevatedButton(
                    onPressed: () {
                      // Call the Cubit method to navigate to the login screen
                      context.read<StartScreenCubit>().navigateToLogin(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const Spacer(),
                  // Footer Text
                  Text(
                    "Sparkle effortlessly with us.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserratAlternates(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 110),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
