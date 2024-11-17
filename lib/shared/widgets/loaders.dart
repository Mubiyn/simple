import 'package:flutter/material.dart';
import 'package:simple_app/shared/utils/theme_configs/size_utils.dart';
import 'package:simple_app/shared/utils/theme_configs/theme.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.isSmall = false,
  });
  final bool? isSmall;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: !isSmall! ? 80.w : 30.w,
        width: !isSmall! ? 80.w : 30.w,
        decoration: BoxDecoration(
          color: context.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: CircularProgressIndicator.adaptive(
          strokeWidth: !isSmall! ? 5.h : 3.h,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
