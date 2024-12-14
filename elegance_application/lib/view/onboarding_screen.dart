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
      "image": "assets/images/onb.jpg",
      "title": "Discover Stunning Jewelry💍💎",
      "description":
          "Find timeless pieces crafted with precision and elegance.",
    },
    {
      "image": "assets/images/jewelry.jpg",
      "title": "Personalize Your Look🪞✨",
      "description":
          "Create your unique style with customizable jewelry designs.",
    },
    {
      "image": "assets/images/splash3.jpeg",
      "title": "Shop with Confidence🛍️🪄",
      "description":
          "Enjoy free returns and a lifetime warranty on all purchases.",
    },
  ];

  void _goToLogin() {
    Navigator.pushReplacementNamed(context, '/start screen');
  }

  void _skipToLastPage() {
    _controller.jumpToPage(_onboardingData.length - 1);
  }

  void _goBack() {
    if (_currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

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

          // Top Navigation Bar with Skip Button and Back Button
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button (Only visible on 2nd and 3rd pages)
                if (_currentIndex > 0)
                  IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.black, size: 30),
                    onPressed: _goBack,
                  )
                else
                  const SizedBox(width: 48), // Empty space for alignment

                // Skip Button (Visible on all pages)
                TextButton(
                  onPressed: _skipToLastPage,
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
                      // fontFamily: 'NotoColorEmoji',
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
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color:
                            _currentIndex == index ? Colors.pink : Colors.grey,
                        shape: BoxShape.circle,
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