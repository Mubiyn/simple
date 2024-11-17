import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? _fontFamily = GoogleFonts.inter().fontFamily;

ThemeData simpleLightTheme = FlexThemeData.light(
  fontFamily: _fontFamily,
  colorScheme: lightLogoColorScheme,
  useMaterial3: true,
).copyWith(
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    },
  ),
);

ThemeData simpleDarkTheme = FlexThemeData.dark(
  fontFamily: _fontFamily,
  colorScheme: darkLogoColorScheme,
  useMaterial3: true,
).copyWith(
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    },
  ),
);

ColorScheme? lightLogoColorScheme = const ColorScheme(
  primary: Color(0xff154ec1),
  secondary: Color(0xFF767C88),
  surface: Color(0xFFFFFFFF),
  error: Color(0xFFE42222),
  onPrimary: Color(0xFFFFFFFF),
  onSecondary: Color(0xFF262824),
  onSurface: Color(0xFF262824),
  onError: Color(0xFFE42222),
  brightness: Brightness.light,
  inversePrimary: Color.fromARGB(255, 84, 120, 192),
  inverseSurface: Color(0xFFFFFFFF),
  onPrimaryContainer: Color(0xFFFFFFFF),
  errorContainer: Color(0xffFFD43A),
  onErrorContainer: Color(0xffFFD43A),
  onInverseSurface: Color(0xFFFFFFFF),
  onSecondaryContainer: Color(0xFFFFFFFF),
  onSurfaceVariant: Color(0xFF262824),
  onTertiary: Color(0xFFF4F6F8),
  onTertiaryContainer: Color(0xFFF4F6F8),
  outline: Colors.grey,
  outlineVariant: Colors.grey,
  primaryContainer: Color(0xFFF4F6F8),
  scrim: Color(0xFFF4F6F8),
  secondaryContainer: Color(0xFFF4F6F8),
  shadow: Color(0xFFF4F6F8),
  surfaceTint: Color(0xFFF4F6F8),
  surfaceContainerHighest: Color(0xFFF4F6F8),
  tertiary: Color(0xFFF4F6F8),
  tertiaryContainer: Color(0xFFF4F6F8),
);
ColorScheme? darkLogoColorScheme = const ColorScheme(
  primary: Color.fromARGB(255, 189, 208, 246),
  secondary: Color(0xFF767C88),
  surface: Color(0xFF262824),
  error: Color(0xFFE42222),
  onPrimary: Color(0xFF262824),
  onSecondary: Color(0xFFFFFFFF),
  onSurface: Color(0xFFFFFFFF),
  onError: Color(0xFFE42222),
  brightness: Brightness.light,
  inversePrimary: Color(0xFF262824),
  inverseSurface: Color(0xFFFFFFFF),
  onPrimaryContainer: Color(0xFFFFFFFF),
  errorContainer: Color(0xffFFD43A),
  onErrorContainer: Color(0xffFFD43A),
  onInverseSurface: Color(0xFFFFFFFF),
  onSecondaryContainer: Color(0xFFFFFFFF),
  onSurfaceVariant: Color(0xFFFFFFFF),
  onTertiary: Color.fromARGB(255, 102, 103, 101),
  onTertiaryContainer: Color.fromARGB(255, 102, 103, 101),
  outline: Colors.grey,
  outlineVariant: Colors.grey,
  primaryContainer: Color.fromARGB(255, 102, 103, 101),
  scrim: Color.fromARGB(255, 102, 103, 101),
  secondaryContainer: Color.fromARGB(255, 102, 103, 101),
  shadow: Color.fromARGB(255, 102, 103, 101),
  surfaceTint: Color.fromARGB(255, 102, 103, 101),
  surfaceContainerHighest: Color.fromARGB(255, 102, 103, 101),
  tertiary: Color.fromARGB(255, 102, 103, 101),
  tertiaryContainer: Color.fromARGB(255, 102, 103, 101),
);

extension FastColor on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primary => colorScheme.primary;

  Color get secondary => colorScheme.secondary;

  Color get tertiary => colorScheme.tertiary;

  Color get primaryContainer => colorScheme.primaryContainer;

  Color get secondaryContainer => colorScheme.secondaryContainer;

  Color get tertiaryContainer => colorScheme.tertiaryContainer;

  Color get onPrimary => colorScheme.onPrimary;

  Color get onSecondary => colorScheme.onSecondary;

  Color get onTertiary => colorScheme.onTertiary;

  Color get background => colorScheme.surface;

  Color get onBackground => colorScheme.onSurface;

  Color get surface => colorScheme.surface;

  Color get onSurface => colorScheme.onSurface;

  Color get surfaceTint => colorScheme.surfaceTint;

  Color get error => colorScheme.error;

  Color get onError => colorScheme.onError;

  Color get outline => colorScheme.outline;

  Color get inversePrimary => colorScheme.inversePrimary;

  Color get inverseSurface => colorScheme.inverseSurface;

  Color get onInverseSurface => colorScheme.onInverseSurface;
}
