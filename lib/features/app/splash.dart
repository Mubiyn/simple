import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_app/features/home/logic/simple_state_provider.dart';
import 'package:simple_app/service_locators/simple_locator.dart';
import 'package:simple_app/shared/utils/theme_configs/size_utils.dart';
import 'package:simple_app/shared/utils/theme_configs/text_theme.dart';
import 'package:simple_app/shared/widgets/loaders.dart';

class SimpleSplashScreen extends StatefulWidget {
  const SimpleSplashScreen({super.key});

  @override
  State<SimpleSplashScreen> createState() => _SimpleSplashScreenState();
}

class _SimpleSplashScreenState extends State<SimpleSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 0.8).animate(_controller);
    moveToLoginScreen();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void moveToLoginScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      checkUserState();
    });
  }

  void checkUserState() {
    if (simpleStateProvider.stateStatus == StateStatus.notLoggedIn) {
      context.replace('/login');
    } else {
      context.replace('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: Icon(
                        Icons.event,
                        size: 50.h,
                      ),
                    );
                  },
                ),
              ),
              Text(
                'Simple Event App',
                style: context.displayMedium,
              )
            ],
          ),
          const AppLoader(
            isSmall: true,
          ),
        ],
      ),
    );
  }
}
