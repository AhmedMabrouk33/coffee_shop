import 'package:flutter/material.dart';

class LabelTextFieldWidget extends StatelessWidget {
  const LabelTextFieldWidget({
    super.key,
    this.hiddenInputText = false,
    required this.label,
    this.autoFocus = false,
    this.labelTextStyle,
    required this.controller,
    required this.autoChangeFocus,
    required this.hint,
    required this.leftPadding,
    required this.rightPadding,
    required this.keyboardType,
    required this.spacingBetween,
  });

  final String label;
  final bool autoFocus;
  final TextStyle? labelTextStyle;
  final TextEditingController controller;
  final bool autoChangeFocus;
  final String hint;
  final double leftPadding;
  final double rightPadding;
  final TextInputType keyboardType;
  final bool hiddenInputText;

  /// Space between label and Text field.
  final double spacingBetween;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: labelTextStyle ??
                Theme.of(context).inputDecorationTheme.labelStyle,
          ),
          SizedBox(height: spacingBetween),
          TextField(
            obscureText: hiddenInputText,
            style: Theme.of(context).textTheme.titleMedium,
            autofocus: autoFocus,
            controller: controller,
            keyboardType: keyboardType,
            onEditingComplete:
                autoChangeFocus ? () => Focus.of(context).nextFocus() : null,
            decoration: InputDecoration(hintText: hint),
          ),
        ],
      ),
    );
  }
}
