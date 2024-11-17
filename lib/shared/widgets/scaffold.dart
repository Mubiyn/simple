import 'package:flutter/material.dart';
import 'package:simple_app/shared/utils/theme_configs/theme.dart';
import 'package:simple_app/shared/widgets/loaders.dart';

class SimpleScaffold extends StatefulWidget {
  const SimpleScaffold({
    super.key,
    required this.body,
    this.backgroundColor,
    this.isLoading = false,
    this.appBar,
    this.floatingActionButton,
    this.isUnavailableFeatureScreen = false,
    this.bottomsheet,
    this.bottomAppBar,
    this.drawer,
  });

  final Widget body;
  final Color? backgroundColor;
  final bool isLoading;
  final PreferredSizeWidget? appBar;
  final Widget? bottomsheet, drawer;
  final Widget? floatingActionButton, bottomAppBar;
  final bool isUnavailableFeatureScreen;

  @override
  State<SimpleScaffold> createState() => _SimpleScaffoldState();
}

class _SimpleScaffoldState extends State<SimpleScaffold> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        floatingActionButton: widget.floatingActionButton,
        bottomSheet: widget.bottomsheet,
        drawer: widget.drawer,
        backgroundColor: widget.backgroundColor,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: widget.bottomAppBar,
        appBar: widget.appBar,
        body: Stack(
          children: [
            widget.body,
            if (widget.isLoading) const AppLoader(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.leading,
      this.actions,
      this.backgroundColor,
      this.centerTitle,
      this.isLoading = false});
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool? centerTitle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.background,
      title: title != null
          ? AbsorbPointer(absorbing: isLoading, child: title)
          : null,
      leading: leading != null
          ? AbsorbPointer(absorbing: isLoading, child: leading)
          : null,
      actions: actions != null
          ? [
              ...actions!.map((action) => AbsorbPointer(
                    absorbing: isLoading,
                    child: action,
                  ))
            ]
          : actions,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
