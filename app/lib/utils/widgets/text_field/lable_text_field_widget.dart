import 'package:flutter/material.dart';

class LabelTextFieldWidget extends StatelessWidget {
  const LabelTextFieldWidget({
    super.key,
    this.hiddenInputText = false,
    required this.label,
    this.autoFocus = false,
    this.labelTextStyle,
    required this.controller,
    required this.hint,
    required this.leftPadding,
    required this.rightPadding,
    required this.keyboardType,
    required this.spacingBetween,
    required this.onEditingComplete,
  });

  final String label;
  final bool autoFocus;
  final TextStyle? labelTextStyle;
  final TextEditingController controller;
  final String hint;
  final double leftPadding;
  final double rightPadding;
  final TextInputType keyboardType;
  final bool hiddenInputText;

  /// Space between label and Text field.
  final double spacingBetween;
  final VoidCallback onEditingComplete;

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
            onEditingComplete: onEditingComplete,
            decoration: InputDecoration(hintText: hint),
          ),
        ],
      ),
    );
  }
}
