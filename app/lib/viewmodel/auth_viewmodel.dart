import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// import '../routes/screen_name.dart';
import '../routes/screen_state_name.dart' as stateName;

import '../state/auth/splash_state.dart';
import '../state/auth/login_state.dart';
import '../state/auth/sign_up_state.dart';
import '../state/auth/forget_password_state.dart';

class AuthViewModel extends GetxController {
  String _currentScreenState = stateName.authSplashState;
  String _previousScreenState = stateName.authLoginState;
  bool isRememberMe = false;

  // Text field Controllers.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Widget get currentScreenState => switch (_currentScreenState) {
        stateName.authSplashState => const AuthSplashState(),
        stateName.authLoginState => const AuthLoginState(),
        stateName.authSignUpState => const AuthSignUpState(),
        stateName.authForgetPasswordState => const AuthForgetPasswordState(),
        _ => Container(),
      };

  // FIXME: Error @ Navigte and Pop State
  void navigateToNewState(String newState) {
    if (newState == stateName.authSignUpState) {
      _clearTextFieldController();
    }
    _previousScreenState = _currentScreenState;
    _currentScreenState = newState;
    update();
  }

  // FIXME: Error @ Navigte and Pop State
  void popCurrentState() {
    if (_currentScreenState == stateName.authSplashState ||
        _currentScreenState == stateName.authLoginState) {
    } else {
      _currentScreenState = _previousScreenState;
      _previousScreenState = stateName.authLoginState;
      _clearTextFieldController();
      update();
    }
  }

  void rememberMeAction() {
    isRememberMe = !isRememberMe;
    update([const ObjectKey('remember_me_flag')]);
  }

  void _clearTextFieldController() {
    // Clear all text field field.
    emailController.clear();
    passwordController.clear();
    userNameController.clear();
    confirmPasswordController.clear();
  }

  /// This Function called from forget password state, @ Case:
  /// True : Reset password state.
  /// False: New password state.
  ///
  bool isShowResetPassword() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    return false;
  }
}
