import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simple_app/features/app/app.dart';
import 'package:simple_app/service_locators/app_locator.dart';
import 'package:simple_app/shared/utils/resources/viewmodels.dart';
import 'package:simple_app/shared/utils/string_setups/assets.dart';

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
