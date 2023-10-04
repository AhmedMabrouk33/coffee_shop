import 'package:flutter/material.dart';

typedef CustomClipperPathFunc = Path Function({
  required Size size,
  required double containerHeight,
  required double containerWidth,
});

// class

class MyCustomClipper extends CustomClipper<Path> {
  final double containerHeight;
  final double containerWidth;
  final CustomClipperPathFunc clipPathFunc;

  const MyCustomClipper({
    required this.containerHeight,
    required this.containerWidth,
    required this.clipPathFunc,
  });

  @override
  Path getClip(Size size) => clipPathFunc(
        size: size,
        containerHeight: containerHeight,
        containerWidth: containerWidth,
      );

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
