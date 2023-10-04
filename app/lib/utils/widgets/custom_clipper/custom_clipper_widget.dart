import 'package:flutter/material.dart';

typedef CustomClipperPathFunc = Path Function(Size size);

// class

class MyCustomClipper extends CustomClipper<Path> {
  final CustomClipperPathFunc clipPathFunc;

  const MyCustomClipper({required this.clipPathFunc});

  @override
  Path getClip(Size size) => clipPathFunc(size);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
