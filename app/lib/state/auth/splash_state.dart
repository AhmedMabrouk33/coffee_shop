import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodel/auth_viewmodel.dart';

import '../../routes/screen_state_name.dart' show authLoginState;

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
        // TODO: This Text will get from Splash Screen repository{From API}.
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 24),
          child: Text(
            'Find The best coffee for You',
            softWrap: true,
            textScaleFactor: MediaQuery.sizeOf(context).height > 360
                ? MediaQuery.sizeOf(context).height / 800
                : 0.35,
            style: Get.textTheme.displayLarge,
          ),
        ),
        const Spacer(),

        Image.asset(
          'assets/images/logo.png',
          // width: 200,
          // height: 200,
          scale: MediaQuery.sizeOf(context).aspectRatio < 1
              ? MediaQuery.sizeOf(context).aspectRatio * (800 / 360)
              : MediaQuery.sizeOf(context).aspectRatio,
          // fit: BoxFit.cover,
        ),

        const Spacer(),

        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => Get.find<AuthViewModel>()
                    .navigateToNewState(authLoginState),
                style: Get.theme.elevatedButtonTheme.style?.copyWith(
                  fixedSize: MaterialStatePropertyAll(
                    Size(MediaQuery.sizeOf(context).width * (100 / 360), 50),
                  ),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  iconSize: const MaterialStatePropertyAll(50),
                  shape: const MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(40.5),
                      ),
                    ),
                  ),
                ),
                child: const Icon(Icons.arrow_right),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
