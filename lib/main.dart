import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simple_app/core/service_locators/app_locator.dart';
import 'package:simple_app/features/splash/app.dart';
import 'package:simple_app/shared/utilities/resources/viewmodels.dart';
import 'package:simple_app/shared/utilities/string_setups/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SimpleAppServiceLocator.initialize();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
  ]).then((value) {
    runApp(
      MultiProvider(
        providers: [...simpleAppProviders],
        child: CalendarControllerProvider(
          controller: EventController()..addAll(simpleEvents),
          child: const SimpleEventApp(),
        ),
      ),
    );
  });
}
