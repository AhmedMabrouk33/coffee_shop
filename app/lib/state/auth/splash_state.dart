import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodel/auth_viewmodel.dart';
// import '../';

class AuthSplashState extends StatelessWidget {
  const AuthSplashState({super.key});

  @override
  Widget build(BuildContext context) {
    print(
        'Aspect ratio from Auth splash state is ${MediaQuery.sizeOf(context).aspectRatio}');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * (104 / 800),
        ),
        // TODO: This Text will get from Splash Screen repository.
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 24),
          child: Text(
            'Find The best coffee for You',
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * (130 / 800),
        ),
        Image.asset(
          'assets/images/logo.png',
          // width: 200,
          // height: 200,
          scale: MediaQuery.sizeOf(context).aspectRatio < 1
              ? MediaQuery.sizeOf(context).aspectRatio * (800 / 360)
              : MediaQuery.sizeOf(context).aspectRatio,
          // fit: BoxFit.cover,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * (130 / 800),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.arrow_right),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
