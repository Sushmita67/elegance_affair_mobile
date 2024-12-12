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
      "image": "assets/images/splash1.png", // Replace with your jewelry images
      "title": "Discover Stunning Jewelry",
      "description": "Find timeless pieces crafted with precision and elegance."
    },
    {
      "image": "assets/images/splash2.jpeg",
      "title": "Personalize Your Look",
      "description":
          "Create your unique style with customizable jewelry designs."
    },
    {
      "image": "assets/images/splash3.jpeg",
      "title": "Shop with Confidence",
      "description":
          "Enjoy free returns and a lifetime warranty on all purchases."
    },
  ];

  void _goToHome() {
    Navigator.pushReplacementNamed(
        context, '/home'); // Navigate to the home page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _onboardingData[index]["image"]!,
                      height: 300,
                      width: 300,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _onboardingData[index]["title"]!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _onboardingData[index]["description"]!,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _goToHome, // Skip button always navigates to home
                child: const Text("Skip"),
              ),
              Row(
                children: List.generate(
                  _onboardingData.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.pink : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (_currentIndex == _onboardingData.length - 1) {
                    _goToHome(); // On the last page, navigate to home
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(_currentIndex == _onboardingData.length - 1
                    ? "Get Started"
                    : "Next"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
