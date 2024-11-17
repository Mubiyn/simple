import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/shared/utilities/theme_configs/size_utils.dart';
import 'package:simple_app/shared/utilities/theme_configs/text_theme.dart';
import 'package:simple_app/shared/utilities/theme_configs/theme.dart';
import 'package:simple_app/shared/widgets/textfields.dart';

class SimpleSimpleDivider extends StatelessWidget {
  const SimpleSimpleDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VerticalPadding(
        child: Divider(
      color: context.outline.withOpacity(0.2),
    ));
  }
}

class SimpleSimpleSwitch extends StatelessWidget {
  const SimpleSimpleSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        value: value, activeColor: context.primary, onChanged: onChanged);
  }
}

class SimpleDropdownField extends StatefulWidget {
  final String hintText;
  final List<String> values;
  final Function(String?) onChanged;
  final String? selectedValue;
  final bool? isExpanded;
  final double? height;

  const SimpleDropdownField({
    super.key,
    required this.hintText,
    required this.values,
    required this.onChanged,
    this.selectedValue,
    this.isExpanded = true,
    this.height,
  });

  @override
  State<SimpleDropdownField> createState() => _SimpleDropdownFieldState();
}

class _SimpleDropdownFieldState extends State<SimpleDropdownField> {
  bool _isFocused = false;
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _isFocused = hasFocus;
        });
      },
      child: Container(
        height: widget.height ?? 40.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: _isFocused ? context.primary : context.outline,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: DropdownButton<String>(
              hint: Text(
                widget.hintText,
                style: context.bodySmall,
              ),
              value: widget.selectedValue,
              icon: Icon(Icons.keyboard_arrow_down,
                  color: _isFocused ? context.primary : context.outline),
              isExpanded: widget.isExpanded!,
              items: widget.values.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: context.bodyLarge,
                  ),
                );
              }).toList(),
              onChanged: widget.onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
