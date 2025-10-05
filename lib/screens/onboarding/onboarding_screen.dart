import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final List<Map<String, String>> pages = [
    {
      'image': "assets/images/onboarding1.jpg",
      'title': 'Welcome to Fixly',
      'desc':
          'Connecting customers with trusted technicians anytime, anywhere.',
      'button': 'Next',
      'secondary': 'Skip',
    },
    {
      'image': 'assets/images/onboarding2.jpg',
      'title': 'Trusted, Vetted & Verified Experts',
      'desc':
          'Every booking and payment is secure, with trusted professionals.',
      'button': 'Next',
      'secondary': 'Skip',
    },
    {
      'image': 'assets/images/onboarding3.jpg',
      'title': 'Let’s Get Things Fixed!',
      'desc': 'Sign up as a customer or technician and get started today.',
      'button': 'Get Started',
      'secondary': 'Login',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder:
                    (child, animation) =>
                        FadeTransition(opacity: animation, child: child),
                child: _buildPage(currentPage),
                layoutBuilder:
                    (currentChild, previousChildren) => Stack(
                      children: [if (currentChild != null) currentChild],
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: Size.fromHeight(48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        if (currentPage < pages.length - 1) {
                          setState(() {
                            currentPage += 1;
                          });
                        } else {
                          context.goOff(LoginScreen());
                        }
                      },
                      child: Text(
                        pages[currentPage]['button']!,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.goOff(LoginScreen());
                    },
                    child: Text(
                      pages[currentPage]['secondary']!,
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    final page = pages[index];
    return Container(
      key: ValueKey<int>(index),
      padding: EdgeInsets.only(top: 32, left: 16, right: 16),
      width: double.infinity,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              page['image']!,
              height: context.height() * .4,
              width: context.width(),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 32),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: SmoothPageIndicator(
                  controller: FixedPageController(currentPage),
                  count: pages.length,
                  effect: WormEffect(
                    activeDotColor: primaryColor,
                    dotColor: Colors.deepPurple.shade100,
                    spacing: 12,
                    dotHeight: 5,
                    dotWidth: context.width() / 4,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 32),

          Text(
            page['title']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            page['desc']!,
            style: TextStyle(fontSize: 16, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Helper controller to fix indicator without scroll
class FixedPageController extends PageController {
  final int currentIndex;
  FixedPageController(this.currentIndex);

  @override
  double get page => currentIndex.toDouble();
}
