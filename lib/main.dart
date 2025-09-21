import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_root.dart';
import 'core/di/di.dart';
import 'core/helper/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // status bar color
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await CacheHelper.init();

  setupGetIt();
  runApp(const AppRoot());
}
