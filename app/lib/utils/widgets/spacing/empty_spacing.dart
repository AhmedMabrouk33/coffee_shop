import 'package:flutter/material.dart';

class EmptySpacingWidget {
  final double heightRatio;
  final double widthRatio;

  const EmptySpacingWidget({
    this.heightRatio = 1,
    this.widthRatio = 1,
  });

  SizedBox build(BuildContext context) => SizedBox(
        height: MediaQuery.sizeOf(context).height * heightRatio,
        width: MediaQuery.sizeOf(context).width * widthRatio,
      );
}
