import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/screen_state_name.dart' as state_name;

import '../state/auth/splash_state.dart';
import '../state/auth/login_state.dart';
import '../state/auth/sign_up_state.dart';
import '../state/auth/forget_password_state.dart';

import '../services/auth_services.dart';
import '../repositories/auth_repository.dart';
import '../utils/exception/error_exception.dart';

class AuthViewModel extends GetxController {
  String _currentScreenState = state_name.authSplashState;
  String _previousScreenState = state_name.authLoginState;
  bool isRememberMe = false;

  // late final AuthRepository _authRepository;
  late final AuthRepository _authRepository;

  AuthViewModel({
    AuthServicesAbstract? authServicesAbstract,
  }) {
    _authRepository = authServicesAbstract == null
        ? const AuthRepository()
        : AuthRepository(authServicesAbstract: authServicesAbstract);
  }

  @override
  void onInit() {
    // PRINT: Check If Auth-viewModel run in test-mode or not.
    print('Is flutter Test mode ${Get.testMode}');

    // TODO: Call function from repository to check if there is user data saved or not in local memory.

    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  // Text field Controllers.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Widget get currentScreenState => switch (_currentScreenState) {
        state_name.authSplashState => const AuthSplashState(),
        state_name.authLoginState => const AuthLoginState(),
        state_name.authSignUpState => const AuthSignUpState(),
        state_name.authForgetPasswordState => const AuthForgetPasswordState(),
        _ => Container(),
      };

  // BUG: Error @ Navigte and Pop State
  void navigateToNewState(String newState) {
    if (newState == state_name.authSignUpState) {
      _clearTextFieldController();
    }
    _previousScreenState = _currentScreenState;
    _currentScreenState = newState;
    update();
  }

  // TODO: Add private function which will replace current state.

  // BUG: Error @ Navigte and Pop State
  void popCurrentState() {
    if (_currentScreenState == state_name.authSplashState ||
        _currentScreenState == state_name.authLoginState) {
    } else {
      _currentScreenState = _previousScreenState;
      _previousScreenState = state_name.authLoginState;
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

  ///
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

  Future<void> loginAction() async {
    try {
      // PRINT: lOGIN action is Called.
      print('Login Action is called');
      await _authRepository.loginAction(
        email: emailController.text.trim().toLowerCase(),
        password: passwordController.text.trim(),
        isRememberMe: isRememberMe,
      );
    } on ErrorException catch (error) {
      if (Get.testMode == false) {
        _showErrorSnackBar(error.errorExceptionMessage);
      } else {
        rethrow;
      }
    }
  }

  void _showErrorSnackBar(String message) async {
    // if (!isTest) {
    // Get.closeAllSnackbars();
    ScaffoldMessenger.of(Get.context!).removeCurrentSnackBar();

    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            padding:
                const EdgeInsets.only(left: 40, right: 15, top: 10, bottom: 5),
            dismissDirection: DismissDirection.up,
            content: Text(message),
          ),
        )
        .closed
        .then((value) => print('Closed snack bar'));
    // } else {
    //   throw message;
    // }
  }
}
