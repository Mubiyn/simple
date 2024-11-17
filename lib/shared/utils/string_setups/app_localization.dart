import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:simple_app/services/route/navigation_service.dart';

class SimpleAppLocalization {
  SimpleAppLocalization(this.locale);

  Locale locale;

  static final Map<String, Map<String, String>> _localizedValues = {'en': {}};

  static SimpleAppLocalization of() {
    return Localizations.of<SimpleAppLocalization>(
        SimpleNavigationService.navigatorKey!.currentContext!,
        SimpleAppLocalization)!;
  }

  static List<String> languages() => _localizedValues.keys.toList();
  String getString(String text) =>
      _localizedValues[locale.languageCode]![text] ?? text;
}

class SimpleAppLocalizationDelegate
    extends LocalizationsDelegate<SimpleAppLocalization> {
  const SimpleAppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      SimpleAppLocalization.languages().contains(locale.languageCode);

  //Returning a SynchronousFuture here because an async "load" operation
  //cause an async "load" operation
  @override
  Future<SimpleAppLocalization> load(Locale locale) {
    return SynchronousFuture<SimpleAppLocalization>(
        SimpleAppLocalization(locale));
  }

  @override
  bool shouldReload(SimpleAppLocalizationDelegate old) => false;
}

extension LocalizationExtension on String {
  String get tr => SimpleAppLocalization.of().getString(this);
}
