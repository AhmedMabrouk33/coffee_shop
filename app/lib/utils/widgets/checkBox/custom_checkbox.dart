import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.spacingWidth,
    required this.label,
    required this.onTap,
    required this.isSelected,
    required this.checkboxWidth,
    required this.checkboxHeight,
    required this.checkIconSize,
    required this.checkIconColor,
    this.autoFocus = false,
    this.checkboxBorderRadius = 0,
    required this.fillBackgroundColor,
    required this.labelStyle,
  });

  final double checkboxWidth;
  final double checkboxHeight;
  final double checkIconSize;
  final double spacingWidth;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;
  final bool autoFocus;
  final double checkboxBorderRadius;
  final Color fillBackgroundColor;
  final Color checkIconColor;

  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      autofocus: autoFocus,
      // customBorder: UnderlineInputBorder(),
      // focusColor: Color.fromRGBO(228, 215, 195, 0.1),
      // overlayColor:
      //     // const MaterialStatePropertyAll(Color.fromRGBO(228, 215, 195, 0.1)),
      //     const MaterialStatePropertyAll(Colors.transparent),
      // splashColor: Color.fromRGBO(228, 215, 195, 0.1),
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: checkboxWidth,
            height: checkboxHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(checkboxBorderRadius),
              color: fillBackgroundColor,
            ),
            child: isSelected
                ? Icon(
                    Icons.check,
                    color: checkIconColor,
                    size: checkIconSize,
                  )
                : null,
          ),
          SizedBox(width: spacingWidth),
          Text(
            label,
            style: labelStyle,
          ),
        ],
      ),
    );
  }
}
