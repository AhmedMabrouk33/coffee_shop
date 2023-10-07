import 'package:get/get.dart';

import '../utils/exception/auth_exception.dart';

class AuthRepository {
  const AuthRepository();

  Future<void> loginAction({
    required String email,
    required String password,
    required bool isRememberMe,
  }) async {
    try {
      _validateEmail(email);
      _validatePassword(password);
    } catch (e) {
      rethrow;
    }
  }

  void _validateEmail(String email) {
    // if (email.contains('@')) {
    if (email.isEmail) {
    } else {
      throw const RequiredException(errorMessage: 'Email');
    }
  }

  void _validatePassword(String password) {
    var regex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()-_+={}[]|\\;:"<>,./?]).+$',
    );
    if (password.length < 8) {
      throw const RequiredException(errorMessage: 'Password');
    } else {
      if (regex.hasMatch(password)) {
      } else {
        throw const ValidationPasswordException(
          errorMessage:
              'must contain upper case letter, lower case letter and numbers and special characters.',
        );
      }
    }
  }
}
