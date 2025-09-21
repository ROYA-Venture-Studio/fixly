import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helper/app_context.dart';
import 'core/routing/router.dart';
import 'core/routing/routes.dart';
import 'core/theme/colors_manager.dart';
import 'core/theme/text_styles.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      /// Sets the design size for screens util.
      designSize: const Size(375, 812),
      builder:
          (context, child) => MaterialApp(
            /// Sets the navigator key for the application.
            navigatorKey: AppContext.navigatorKey,

            /// Sets the title of the application.
            title: 'Fixly',
            builder: (context, child) {
              return MediaQuery.withClampedTextScaling(
                minScaleFactor: 1.0,
                maxScaleFactor: 1.0,
                child: child!,
              );
            },

            /// Sets the theme of the application.
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                // backgroundColor: Colors.white,
                // foregroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                color: Colors.white,

                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              dialogTheme: DialogTheme(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 0,
              ),
              datePickerTheme: DatePickerThemeData(
                confirmButtonStyle: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    ColorsManager.whiteColor,
                  ),
                  overlayColor: WidgetStateProperty.all(
                    ColorsManager.mainColor,
                  ),
                  foregroundColor: WidgetStateProperty.all(
                    ColorsManager.mainColor,
                  ),

                  textStyle: WidgetStatePropertyAll(
                    TextStyles.font14Medium.copyWith(
                      color: ColorsManager.mainColor,
                    ),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                cancelButtonStyle: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    ColorsManager.whiteColor,
                  ),
                  overlayColor: WidgetStateProperty.all(
                    ColorsManager.mainColor,
                  ),
                  foregroundColor: WidgetStateProperty.all(
                    ColorsManager.mainColor,
                  ),

                  textStyle: WidgetStatePropertyAll(
                    TextStyles.font14Medium.copyWith(
                      color: ColorsManager.mainColor,
                    ),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                todayBackgroundColor: WidgetStateProperty.all(
                  ColorsManager.mainColor,
                ),
                rangeSelectionBackgroundColor: ColorsManager.mainColor,
                dayStyle: TextStyles.font14Medium,
                // Default text style for all days
                todayBorder: const BorderSide(
                  color: ColorsManager.mainColor,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                dividerColor: ColorsManager.mainColor,
                dayShape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                // Added for selected day
                dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return ColorsManager
                        .mainColor; // Background color for selected day
                  }
                  return null; // Default background for unselected days
                }),
                dayForegroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.white; // Text color for selected day
                  }
                  return Colors.black; // Text color for unselected days
                }),
              ),
              primaryColor: Colors.white,
              canvasColor: ColorsManager.mainColor,
              progressIndicatorTheme: ProgressIndicatorThemeData(
                color: ColorsManager.mainColor,
              ),
            ),

            /// Hides the debug banner.
            debugShowCheckedModeBanner: false,

            /// Sets the localization delegates.
            // localizationsDelegates: context.localizationDelegates,

            /// Sets the supported locales.
            // supportedLocales: context.supportedLocales,

            /// Sets the current locale.
            // locale: context.locale,

            /// Sets the route generator for the application.
            onGenerateRoute: AppRouter.generateRoute,

            /// Sets the initial route of the application.
            initialRoute: (kDebugMode) ? Routes.splash : Routes.splash,
          ),
    );
  }
}
//