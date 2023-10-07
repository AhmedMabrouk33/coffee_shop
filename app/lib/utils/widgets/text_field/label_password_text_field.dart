import 'package:flutter/material.dart';

class LabelPasswordTextFieldWidget extends StatefulWidget {
  const LabelPasswordTextFieldWidget({
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
  State<LabelPasswordTextFieldWidget> createState() =>
      _LabelPasswordTextFieldWidgetState();
}

class _LabelPasswordTextFieldWidgetState
    extends State<LabelPasswordTextFieldWidget> {
  bool _hiddenContent = true;

  void _iconHiddenAction() {
    setState(() => _hiddenContent = !_hiddenContent);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: widget.leftPadding, right: widget.rightPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.label,
            style: widget.labelTextStyle ??
                Theme.of(context).inputDecorationTheme.labelStyle,
          ),
          SizedBox(height: widget.spacingBetween),
          TextField(
            obscureText: _hiddenContent,
            style: Theme.of(context).textTheme.titleMedium,
            autofocus: widget.autoFocus,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            onEditingComplete: widget.onEditingComplete,
            decoration: InputDecoration(
              hintText: widget.hint,
              suffixIcon: !_hiddenContent
                  ? IconButton(
                      onPressed: _iconHiddenAction,
                      icon: const Icon(Icons.visibility_off),
                    )
                  : IconButton(
                      onPressed: _iconHiddenAction,
                      icon: const Icon(Icons.remove_red_eye),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
