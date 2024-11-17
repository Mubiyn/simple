import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:simple_app/features/home/logic/simple_state_provider.dart';
import 'package:simple_app/features/home/logic/simple_viewmodel.dart';
import 'package:simple_app/service_locators/app_locator.dart';

final simpleAppProviders = <SingleChildWidget>[
  ChangeNotifierProvider<SimpleUserStateProvider>(
    create: (_) => serviceLocator<SimpleUserStateProvider>(),
  ),
  ChangeNotifierProvider<SimpleViewModel>(
    create: (_) => serviceLocator<SimpleViewModel>(),
  ),
];
