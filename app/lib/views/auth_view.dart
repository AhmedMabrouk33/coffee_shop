import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel/auth_viewmodel.dart';

import '../routes/screen_state_name.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: GetBuilder<AuthViewModel>(
          builder: (authController) => authController.currentScreenState,
        ),
      ),
    );
  }
}
