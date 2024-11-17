import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_app/features/home/logic/simple_viewmodel.dart';
import 'package:simple_app/features/home/ui/widgets/event_view.dart';
import 'package:simple_app/shared/utilities/theme_configs/size_utils.dart';
import 'package:simple_app/shared/utilities/theme_configs/text_theme.dart';
import 'package:simple_app/shared/utilities/theme_configs/theme.dart';
import 'package:simple_app/shared/widgets/scaffold.dart';
import 'package:simple_app/shared/widgets/textfields.dart';

class SimpleHomeScreen extends StatefulWidget {
  const SimpleHomeScreen({super.key});

  @override
  State<SimpleHomeScreen> createState() => _SimpleHomeScreenState();
}

class _SimpleHomeScreenState extends State<SimpleHomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<SimpleViewModel>(builder: (_, value, __) {
      return SimpleScaffold(
        backgroundColor: context.background,
        isLoading: value.isLoading,
        appBar: CustomAppBar(
          centerTitle: false,
          title: Padding(
            padding: EdgeInsets.only(left: smallHorizontalPadding),
            child: Text(
              'Simple Event App',
              style: context.bodyLarge,
            ),
          ),
        ),
        bottomAppBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              activeIcon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.door_front_door_outlined),
              activeIcon: Icon(
                Icons.door_front_door,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
          onTap: (s) {
            setState(() {
              _currentIndex = s;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          unselectedItemColor: context.secondary,
          showUnselectedLabels: true,
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            HomeScreenWidget(),
            DummyWidget(
              title: 'History Screen',
            ),
            DummyWidget(
              title: 'Settings Screen',
            ),
          ],
        ),
      );
    });
  }
}

class DummyWidget extends StatelessWidget {
  const DummyWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: HorizontalPadding(
        child: Center(
            child: Text(
          title,
          style: context.displayMedium,
        )),
      ),
    );
  }
}

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SimpleScaffold(
        body: Stack(
      children: [
        EventViewWidget(
          width: size.width,
        ),
      ],
    ));
  }
}
