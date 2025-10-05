import 'package:fixly/core/app_colors.dart';
import 'package:fixly/core/app_extras.dart';
import 'package:fixly/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      context.goOff(OnboardingScreen());
    });

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          "Fixly",
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}
