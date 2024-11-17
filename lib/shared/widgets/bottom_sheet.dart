// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_app/service_locators/simple_locator.dart';
import 'package:simple_app/shared/utils/theme_configs/size_utils.dart';
import 'package:simple_app/shared/utils/theme_configs/text_theme.dart';
import 'package:simple_app/shared/utils/theme_configs/theme.dart';
import 'package:simple_app/shared/widgets/buttons.dart';
import 'package:simple_app/shared/widgets/scaffold.dart';
import 'package:simple_app/shared/widgets/textfields.dart';

Future<dynamic> showAppBottomSheet(BuildContext context,
    {double? height,
    hPadding,
    vPadding,
    required Widget child,
    required String title,
    bool? isLoading = false,
    bool? isDismissible = false,
    Widget? bottomWidget,
    void Function()? onButtonPressed,
    void Function()? onSheetClosed,
    String? bottomText}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: isDismissible!,
    context: context,
    builder: (context) {
      return Container(
          decoration: BoxDecoration(
            color: context.background,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(bigBorderRadius),
                topRight: Radius.circular(bigBorderRadius)),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: hPadding ?? horizontalPadding,
              vertical: vPadding ?? verticalPadding),
          height: height ?? MediaQuery.sizeOf(context).height * 0.9,
          child: BottomSheetChild(
              isDismissible: isDismissible,
              onSheetClosed: onSheetClosed,
              bottomText: bottomText,
              bottomWidget: bottomWidget,
              isLoading: isLoading,
              onButtonPressed: onButtonPressed,
              title: title,
              child: child));
    },
  );
}

class BottomSheetChild extends StatelessWidget {
  const BottomSheetChild({
    super.key,
    required this.isDismissible,
    this.bottomWidget,
    required this.onSheetClosed,
    this.bottomText,
    this.isLoading,
    this.onButtonPressed,
    required this.child,
    required this.title,
  });
  final bool? isLoading, isDismissible;
  final Widget? bottomWidget;
  final Widget child;
  final void Function()? onButtonPressed, onSheetClosed;
  final String? bottomText;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SimpleScaffold(
      isLoading: isLoading!,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VerticalSpacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.headlineSmall.bold,
                ),
                InkWell(
                    onTap: onSheetClosed ??
                        () {
                          context.pop();
                        },
                    child: const Icon(Icons.cancel_outlined))
              ],
            ),
            VerticalSpacer(
              space: 30.h,
            ),
            child,
          ],
        ),
      ),
      bottomAppBar: BottomAppBar(
        color: context.background,
        elevation: 0,
        child: bottomWidget ??
            SimplePrimaryButton(
              title: bottomText ?? 'Add',
              onPressed: onButtonPressed,
            ),
      ),
    );
  }
}

Future<void> logout(BuildContext context, {bool? isResidents = false}) async {
  await simpleStateProvider.logout().then((value) {
    simpleViewModel.disposeValues();
  });
}
