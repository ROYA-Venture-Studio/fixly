import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void goTo(Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }

  void goOff(Widget screen) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void goOffAll(Widget screen) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }
}

extension ScreenSize on BuildContext {
  double width() => MediaQuery.sizeOf(this).width;
  double height() => MediaQuery.sizeOf(this).height;
}
