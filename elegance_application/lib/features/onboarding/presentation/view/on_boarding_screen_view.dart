// import 'package:elegance/features/onboarding/presentation/view_model/on_boarding_screen_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//
//   final List<String> _onboardingImages = [
//     'assets/images/onboard1.png',
//     'assets/images/onboard2.png',
//     'assets/images/onboard3.png',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     // Automatically transition images every 2 seconds
//     Future.delayed(Duration.zero, _autoScrollImages);
//   }
//
//   void _autoScrollImages() async {
//     while (_currentPage < _onboardingImages.length - 1) {
//       await Future.delayed(const Duration(seconds: 2));
//       if (mounted) {
//         setState(() {
//           _currentPage++;
//         });
//         _pageController.animateToPage(
//           _currentPage,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 controller: _pageController,
//                 onPageChanged: (index) {
//                   setState(() {
//                     _currentPage = index;
//                   });
//                 },
//                 itemCount: _onboardingImages.length,
//                 itemBuilder: (context, index) {
//                   return Center(
//                     child: Image.asset(
//                       _onboardingImages[index],
//                       height: 250, // Adjusted image size
//                       fit: BoxFit.contain,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
//               child: Text(
//                 "Welcome to our app! We are here to simplify your life with our efficient delivery system. Enjoy a seamless experience.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20.0),
//               child: Align(
//                 alignment: Alignment.bottomLeft,
//                 child: TextButton(
//                   onPressed: () {
//                     context
//                         .read<OnBoardingScreenCubit>()
//                         .navigateToLogin(context);
//                   },
//                   child: const Text(
//                     "Skip",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/on_boarding_screen_cubit.dart';


class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/jewels.jpg",
      "title": "Discover Stunning Jewelry\n💍💎",
      "description": "Find timeless pieces crafted with precision and elegance."
    },
    {
      "image": "assets/images/ring.jpg",
      "title": "Personalize Your Look\n🪞✨",
      "description": "Create your unique style with customizable jewelry designs."
    },
    {
      "image": "assets/images/neckset.jpg",
      "title": "Shop with Confidence\n🛍️🪄",
      "description": "Enjoy free returns and a lifetime warranty on all purchases."
    },
  ];

  void _goToLoginPage(BuildContext context) {
    context.read<OnBoardingScreenCubit>().goToLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              _currentPage.value = index;
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
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                child: ValueListenableBuilder<int>(
                  valueListenable: _currentPage,
                  builder: (context, value, child) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _onboardingData[value]['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _onboardingData[value]['description']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 330,
            right: 10,
            child: ValueListenableBuilder<int>(
              valueListenable: _currentPage,
              builder: (context, value, child) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (value == _onboardingData.length - 1) {
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
                      value == _onboardingData.length - 1 ? "Get Started" : "Next",
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 50,
            left: 350,
            child: TextButton(
              onPressed: () => _goToLoginPage(context),
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 330,
            child: ValueListenableBuilder<int>(
              valueListenable: _currentPage,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingData.length,
                        (index) => _buildDiamondDot(index, value),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiamondDot(int index, int currentPage) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.pink : Colors.white70,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Transform.rotate(
        angle: 0.785398,
        child: Container(
          color: currentPage == index ? Colors.pink : Colors.white70,
        ),
      ),
    );
  }
}
