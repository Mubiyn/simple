import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_app/features/splash/splash.dart';
import 'package:simple_app/features/home/ui/home.dart';
import 'package:simple_app/features/home/ui/login.dart';
import 'package:simple_app/services/route/navigation_service.dart';
import 'package:simple_app/services/settings/settings.dart';
import 'package:simple_app/shared/utilities/string_setups/app_localization.dart';
import 'package:simple_app/shared/utilities/theme_configs/size_utils.dart';
import 'package:simple_app/shared/utilities/theme_configs/theme.dart';

class SimpleEventApp extends StatelessWidget {
  const SimpleEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => ValueListenableBuilder(
        valueListenable: simplethemeService.themeMode,
        builder: (context, value, child) {
          return MaterialApp.router(
            title: 'Simple Event App',
            debugShowCheckedModeBanner: false,
            theme: simpleLightTheme,
            darkTheme: simpleDarkTheme,
            themeMode: simplethemeService.themeMode.value,
            routeInformationProvider: _simpleRouter.routeInformationProvider,
            routeInformationParser: _simpleRouter.routeInformationParser,
            routerDelegate: _simpleRouter.routerDelegate,
            localizationsDelegates: const [
              SimpleAppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale(
                'en',
                '',
              ),
            ],
          );
        },
      ),
    );
  }
}

final _simpleRouter = GoRouter(
  navigatorKey: SimpleNavigationService.navigatorKey,
  observers: [
    SimpleNavigationService.routeObserver,
  ],
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SimpleSplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const SimpleHomeScreen(),
    ),
  ],
  debugLogDiagnostics: true,
);
