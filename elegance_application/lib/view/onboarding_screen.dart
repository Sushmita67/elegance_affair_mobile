import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/jewels.jpg",
      "title": "Discover Stunning Jewelry💍💎",
      "description":
          "Find timeless pieces crafted with precision and elegance.",
    },
    {
      "image": "assets/images/ring.jpg",
      "title": "Personalize Your Look🪞✨",
      "description":
          "Create your unique style with customizable jewelry designs.",
    },
    {
      "image": "assets/images/Neckset.jpg",
      "title": "Shop with Confidence🛍️🪄",
      "description":
          "Enjoy free returns and a lifetime warranty on all purchases.",
    },
  ];

  void _goToLogin() {
    Navigator.pushReplacementNamed(context, '/start screen');
  }

  // void _skipToLastPage() {
  //   _controller.jumpToPage(_onboardingData.length - 1);
  // }

  // void _goBack() {
  //   if (_currentIndex > 0) {
  //     _controller.previousPage(
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeInOut,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen Image (Background)
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _onboardingData[index]["image"]!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          // Top Navigation Bar with Skip Button
          Positioned(
            top: 50,
            right: 20,
            child: Row(
              children: [
                TextButton(
                  onPressed: _goToLogin,
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Centered Title and Description with Transparent Background
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black
                    .withOpacity(0.5), // Semi-transparent background
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    _onboardingData[_currentIndex]["title"]!,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  // Description
                  Text(
                    _onboardingData[_currentIndex]["description"]!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          // Bottom Dots and Navigation Buttons
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Dots Indicator
                Row(
                  children: List.generate(
                    _onboardingData.length,
                    (index) => Transform.rotate(
                      angle: 0.785398, // 45 degrees in radians (π/4)
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? const Color.fromARGB(255, 241, 97, 145)
                              : const Color.fromARGB(255, 133, 127, 127),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                  ),
                ),

                // Next or Get Started Button
                TextButton(
                  onPressed: () {
                    if (_currentIndex == _onboardingData.length - 1) {
                      _goToLogin();
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    _currentIndex == _onboardingData.length - 1
                        ? "Get Started"
                        : "Next",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
