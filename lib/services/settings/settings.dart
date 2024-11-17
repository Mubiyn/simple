import 'package:flutter/material.dart';
import 'package:simple_app/service_locators/app_locator.dart';

SimpleThemeService get simplethemeService =>
    serviceLocator<SimpleThemeService>();

class SimpleThemeService {
  SimpleThemeService();

  ValueNotifier<ThemeMode> themeMode = ValueNotifier(getThemeModeFromString(
      sharedPrefs.getString('theme_mode') ?? 'ThemeMode.system'));

  void setThemeMode(String val) {
    sharedPrefs.setString('theme_mode', val);
    themeMode.value = getThemeModeFromString(val);
  }

  static ThemeMode getThemeModeFromString(String val) {
    return ThemeMode.values.firstWhere((e) => e.toString() == val);
  }
}
