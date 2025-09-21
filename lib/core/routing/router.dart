import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../features/splash/splash_screen.dart';
import '../theme/text_styles.dart';
import 'routes.dart';

/// A class that handles the routing for the application.
class AppRouter {
  /// Generates a route based on the given [RouteSettings].
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget getScreen(Widget mobileScreen) {
      return ScreenTypeLayout.builder(
        mobile: (context) => mobileScreen,
        tablet: (context) => NotSupportedScreen(),
        desktop: (context) => NotSupportedScreen(),
        watch: (context) => NotSupportedScreen(),
      );
    }

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => getScreen(SplashScreen()));
      // case Routes.welcome:
      //   return MaterialPageRoute(
      //     builder:
      //         (_) => BlocProvider(
      //           create: (context) => getIt<WelcomeCubit>(),
      //           child: getScreen(WelcomeScreen()),
      //         ),
      //   );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text(
                    'This screen is currently under development',
                    textAlign: TextAlign.center,
                    style: TextStyles.font16RegularBlack,
                  ),
                ),
              ),
        );
    }
  }
}

class NotSupportedScreen extends StatelessWidget {
  const NotSupportedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This Device Is Not Supported",
          style: TextStyles.font28Bold,
        ),
      ),
    );
  }
}
