import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_app/core/network/network.dart';
import 'package:simple_app/core/service_locators/simple_locator.dart';
import 'package:simple_app/services/app/token.dart';
import 'package:simple_app/services/route/observer.dart';
import 'package:simple_app/services/settings/settings.dart';

GetIt serviceLocator = GetIt.instance;
SharedPreferences get sharedPrefs => serviceLocator<SharedPreferences>();
ApiClient get apiClient => serviceLocator<ApiClient>();
SimpleUserState get simpleuserState => serviceLocator<SimpleUserState>();

class SimpleAppServiceLocator {
  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    serviceLocator.registerLazySingleton<SharedPreferences>(() => prefs);
    serviceLocator.registerLazySingleton<SimpleRouteObserver>(
        () => SimpleRouteObserver());
    serviceLocator.registerLazySingleton<ApiClient>(() => ApiClient());
    serviceLocator
        .registerLazySingleton<SimpleThemeService>(() => SimpleThemeService());
    serviceLocator.registerLazySingleton<SimpleUserState>(
        () => SimpleUserStateImplimentationimentation());

    SimpleHomeServiceLocator.initialize();
  }
}
