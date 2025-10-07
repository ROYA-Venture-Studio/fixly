import 'package:fixly/screens/main/main_screen.dart';
import 'package:fixly/screens/splash/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: kDebugMode ? MainScreen() : SplashScreen(),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
//