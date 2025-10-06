import 'package:fixly/screens/home/home_screen.dart';
import 'package:fixly/screens/splash/splash_screen.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: kDebugMode ? HomeScreen() : SplashScreen(),
    );
  }
}
//