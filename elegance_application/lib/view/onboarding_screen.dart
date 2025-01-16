// import 'package:elegance_application/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:elegance_application/features/onboarding/presentation/view_model/onboarding_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../app/di/di.dart';

// class OnboardingScreenView extends StatelessWidget {
//   const OnboardingScreenView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<LoginBloc>(
//           create: (_) => getIt<LoginBloc>(),
//         ),
//         BlocProvider<OnboardingCubit>(
//           create: (context) => OnboardingCubit(
//             loginBloc: context.read<LoginBloc>(),
//           ),
//         ),
//       ],
//       child: const OnboardingScreenContent(),
//     );
//   }
// }

// class OnboardingScreenContent extends StatelessWidget {
//   const OnboardingScreenContent({super.key});

//   final List<Map<String, String>> _slides = const [
//     {
//       "image": "assets/images/jewels.jpg",
//       "title": "Discover Stunning Jewelry💍💎",
//       "description":
//           "Find timeless pieces crafted with precision and elegance.",
//     },
//     {
//       "image": "assets/images/ring.jpg",
//       "title": "Personalize Your Look\n🪞✨",
//       "description":
//           "Create your unique style with customizable jewelry designs.",
//     },
//     {
//       "image": "assets/images/Neckset.jpg",
//       "title": "Shop with Confidence\n🛍️🪄",
//       "description":
//           "Enjoy free returns and a lifetime warranty on all purchases.",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<OnboardingCubit>();

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Fullscreen Image Background
//           PageView.builder(
//             controller: cubit.pageController,
//             itemCount: _slides.length,
//             onPageChanged: cubit.updatePage,
//             itemBuilder: (context, index) {
//               return Image.asset(
//                 _slides[index]["image"]!,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: double.infinity,
//               );
//             },
//           ),

//           // Top Navigation Bar with Skip Button
//           Positioned(
//             top: 50,
//             right: 20,
//             child: TextButton(
//               onPressed: () {
//                 cubit.skipToLogin(context);
//               },
//               child: const Text(
//                 "Skip",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),

//           // Center Title and Description with Transparent Background
//           Positioned(
//             bottom: 100,
//             left: 20,
//             right: 20,
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.5),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Title
//                   Text(
//                     _slides[cubit.state]["title"]!,
//                     style: const TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 10),
//                   // Description
//                   Text(
//                     _slides[cubit.state]["description"]!,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // Bottom Dots Indicator and Buttons
//           Positioned(
//             bottom: 20,
//             left: 20,
//             right: 20,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Rotated Rectangle Indicators
//                 Row(
//                   children: List.generate(
//                     _slides.length,
//                     (index) => Transform.rotate(
//                       angle: 0.785398,
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 4),
//                         width: 10,
//                         height: 10,
//                         decoration: BoxDecoration(
//                           color: cubit.state == index
//                               ? const Color.fromARGB(255, 241, 97, 145)
//                               : const Color.fromARGB(255, 133, 127, 127),
//                           shape: BoxShape.rectangle,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 // Navigation Button
//                 TextButton(
//                   onPressed: () {
//                     if (cubit.state == _slides.length - 1) {
//                       cubit.skipToLogin(context);
//                     } else {
//                       cubit.nextPage(context, _slides.length);
//                     }
//                   },
//                   child: Text(
//                     cubit.state == _slides.length - 1 ? "Get Started" : "Next",
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
