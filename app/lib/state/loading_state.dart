import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

// 360/800 ==> 0.45

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context).aspectRatio);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        // BUG: Make Image flexible.
        Image.asset(
          'assets/images/loading_animation.gif',
          fit: BoxFit.cover,
          height: MediaQuery.sizeOf(context).height * (200 / 800),
          width: MediaQuery.sizeOf(context).width * (200 / 360),
          // scale: MediaQuery.sizeOf(context).aspectRatio,
          scale: 360 / 800,
          // color: Colors.green,
        ),
        Text(
          'Loading your data',
          style: Get.textTheme.displayLarge,
        ),
        Text(
          'Loading your data',
          style: Get.textTheme.titleMedium?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
