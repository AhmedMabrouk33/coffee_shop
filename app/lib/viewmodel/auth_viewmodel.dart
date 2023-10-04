import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// import '../routes/screen_name.dart';
import '../routes/screen_state_name.dart' as stateName;

import '../state/auth/splash_state.dart';
import '../state/auth/login_state.dart';

class AuthViewModel extends GetxController {
  String _currentScreenState = stateName.authSplashState;
  String _previousScreenState = stateName.authLoginState;
  bool isRememberMe = false;

  // Text field Controllers.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget get currentScreenState => switch (_currentScreenState) {
        stateName.authSplashState => const AuthSplashState(),
        stateName.authLoginState => const AuthLoginState(),
        _ => Container(),
      };

  void navigateToNewState(String newState) {
    _previousScreenState = _currentScreenState;
    _currentScreenState = newState;
    update();
  }

  void popCurrentState() {
    if (_currentScreenState == stateName.authSplashState ||
        _currentScreenState == stateName.authLoginState) {
    } else {
      _currentScreenState = _previousScreenState;
      _previousScreenState = stateName.authLoginState;
      update();
    }
  }

  void rememberMeAction() {
    isRememberMe = !isRememberMe;
    update([const ObjectKey('remember_me_flag')]);
  }
}
