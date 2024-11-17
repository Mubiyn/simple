import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:simple_app/shared/utilities/theme_configs/text_theme.dart';
import 'package:simple_app/shared/utilities/theme_configs/theme.dart';

class SimplePrimaryButton extends StatelessWidget {
  const SimplePrimaryButton(
      {super.key,
      required this.title,
      this.icon,
      this.size,
      this.fullWidth = true,
      this.onPressed,
      this.btnColor,
      this.textStyle});
  final String title;
  final IconData? icon;
  final Color? btnColor;
  final void Function()? onPressed;
  final TextStyle? textStyle;

  ///must be gf sizes
  final double? size;
  final bool? fullWidth;

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: onPressed,
      text: title,
      textStyle: textStyle ?? context.bodyLarge.bold.onPrimary,
      color: btnColor ?? context.primary,
      size: size ?? GFSize.LARGE,
      fullWidthButton: fullWidth!,
    );
  }
}

class AppFabButton extends StatelessWidget {
  const AppFabButton({
    super.key,
    this.onPressed,
    required this.labelText,
  });
  final void Function()? onPressed;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: context.primary,
        onPressed: onPressed,
        heroTag: UniqueKey(),
        label: Text(
          labelText,
          style: context.bodyLarge.bold.onTertiary,
        ));
  }
}
