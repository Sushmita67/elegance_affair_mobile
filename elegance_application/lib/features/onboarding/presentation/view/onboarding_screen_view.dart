// import 'package:elegance_application/app/di/di.dart';
// import 'package:elegance_application/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:elegance_application/features/onboarding/presentation/view_model/onboarding_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

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
//       "image": "assets/images/neckset.jpg",
//       "title": "Shop with Confidence\n🛍️🪄",
//       "description":
//           "Enjoy free returns and a lifetime warranty on all purchases.",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<OnboardingCubit>();
//     final totalSlides = _slides.length;

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background images using PageView
//           PageView.builder(
//             controller: cubit.pageController,
//             itemCount: totalSlides,
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

//           // Skip Button
//           Positioned(
//             top: 50,
//             right: 20,
//             child: TextButton(
//               onPressed: () => cubit.skipToLogin(context),
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

//           // Title and Description with conditional background color
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

//           // Indicators and Navigation Buttons
//           Positioned(
//             bottom: 20,
//             left: 20,
//             right: 20,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: List.generate(
//                     totalSlides,
//                     (index) => Transform.rotate(
//                       angle: 0.785398, // 45 degrees in radians
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
//                   onPressed: () => cubit.nextPage(context, totalSlides),
//                   child: Text(
//                     cubit.state == totalSlides - 1 ? "Get Started" : "Next",
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elegance_application/features/onboarding/presentation/view_model/onboarding_cubit.dart';

class OnboardingScreenView extends StatefulWidget {
  const OnboardingScreenView({super.key});

  @override
  State<OnboardingScreenView> createState() => _OnboardingScreenViewState();
}

class _OnboardingScreenViewState extends State<OnboardingScreenView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/jewels.jpg",
      "title": "Discover Stunning Jewelry\n💍💎",
      "description": "Find timeless pieces crafted with precision and elegance."
    },
    {
      "image": "assets/images/ring.jpg",
      "title": "Personalize Your Look\n🪞✨",
      "description":
          "Create your unique style with customizable jewelry designs."
    },
    {
      "image": "assets/images/neckset.jpg",
      "title": "Shop with Confidence\n🛍️🪄",
      "description":
          "Enjoy free returns and a lifetime warranty on all purchases."
    },
  ];

  void _goToLoginPage(BuildContext context) {
    context.read<OnboardingCubit>().skipToLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen PageView for Background Images
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _onboardingData[index]['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),
          // Description Section Positioned Above Progress Dots
          Positioned(
            bottom: 120,
            left: 20,
            right: 20,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25),
                    bottom: Radius.circular(25),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _onboardingData[_currentPage]['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _onboardingData[_currentPage]['description']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          // Navigation Buttons and Skip Button (Placed Below the Description Box)
          Positioned(
            bottom: 25,
            left: 330,
            right: 10,
            child: Column(
              children: [
                // Navigation Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage == _onboardingData.length - 1) {
                        _goToLoginPage(context);
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      _currentPage == _onboardingData.length - 1
                          ? "Get Started"
                          : "Next",
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 350,
            right: 0,
            child: Column(
              children: [
                // Skip Button
                TextButton(
                  onPressed: () => _goToLoginPage(context),
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Progress Indicator Dots in Diamond Shape
          Positioned(
            bottom: 50,
            left: 0,
            right: 330,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingData.length,
                (index) => _buildDiamondDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget: Diamond-shaped Progress Dots
  Widget _buildDiamondDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.pink : Colors.white70,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Transform.rotate(
        angle: 0.785398,
        child: Container(
          color: _currentPage == index ? Colors.pink : Colors.white70,
        ),
      ),
    );
  }
}
