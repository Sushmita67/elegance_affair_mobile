// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../view_model/onboarding_cubit.dart';
//
// class OnboardingView extends StatelessWidget {
//   const OnboardingView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Fullscreen background image
//           _buildBackgroundImage('assets/images/onboarding-1.jpg'),
//           _buildSlideContent(context),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBackgroundImage(String imagePath) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(imagePath),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Container(
//         color: Colors.black.withValues(alpha: 0.6), // Adds dark overlay
//       ),
//     );
//   }
//
//   Widget _buildSlideContent(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Welcome to Nirlipta Yoga!',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Begin your journey toward balance, mindfulness, and well-being.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white70,
//               ),
//             ),
//             const SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to LoginView
//                 context.read<OnboardingCubit>().goToLogin(context);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.transparent,
//                 shadowColor: Colors.transparent,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: const [
//                   Text(
//                     'Start Your Journey',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   Icon(
//                     Icons.arrow_forward_ios,
//                     color: Colors.white,
//                     size: 18,
//                   ),
//                 ],
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
import '../view_model/onboarding_cubit.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

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
    context.read<OnboardingCubit>().goToLogin(context);
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
