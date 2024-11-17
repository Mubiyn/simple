import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:simple_app/shared/utilities/theme_configs/text_theme.dart';

showAppSnackBar(BuildContext context,
    {String? title = 'Oh Snap!',
    required String description,
    ContentType? contentType}) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.fixed,
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title!,
      message: description,
      contentType: contentType ?? ContentType.failure,
    ),
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

showSimpleAlertDialog(BuildContext context,
    {String? title = 'Alert',
    required String message,
    VoidCallback? onCancel,
    VoidCallback? onProceed}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GFAlert(
        title: title!,
        content: Text(message),
        onTapCancel: onCancel,
        onTapOk: onProceed,
        okButtonText: 'Proceed',
        cancelButtonText: 'Cancel',
        okButtonTextStyle: context.bodyLarge.onError,
      );
    },
  );
}
