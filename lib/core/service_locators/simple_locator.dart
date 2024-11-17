import 'package:simple_app/features/home/logic/simple_state_provider.dart';
import 'package:simple_app/features/home/logic/simple_api.dart';
import 'package:simple_app/features/home/logic/simple_service.dart';
import 'package:simple_app/features/home/logic/simple_viewmodel.dart';
import 'package:simple_app/core/service_locators/app_locator.dart';

SimpleService get simpleService => serviceLocator<SimpleService>();
SimpleApi get simpleApi => serviceLocator<SimpleApi>();
SimpleViewModel get simpleViewModel => serviceLocator<SimpleViewModel>();
SimpleUserStateProvider get simpleStateProvider =>
    serviceLocator<SimpleUserStateProvider>();

class SimpleHomeServiceLocator {
  static Future<void> initialize() async {
    serviceLocator
        .registerLazySingleton<SimpleApi>(() => SimpleApiImplimentation());
    serviceLocator.registerLazySingleton<SimpleService>(
        () => SimpleServiceImplimentation());
    serviceLocator.registerLazySingleton<SimpleUserStateProvider>(
        () => SimpleUserStateProvider());
    serviceLocator.registerFactory<SimpleViewModel>(() => SimpleViewModel());

    simpleStateProvider.initialize();
  }
}
