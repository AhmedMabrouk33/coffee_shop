import 'package:get/get.dart';

import '../utils/exception/auth_exception.dart';

import '../services/auth_services.dart';

import '../model/user_model.dart';

class AuthRepository {
  const AuthRepository({
    this.authServicesAbstract =  const AuthServicesImplement(),
  });

  final AuthServicesAbstract authServicesAbstract;

  Future<void> loginAction({
    required String email,
    required String password,
    required bool isRememberMe,
  }) async {
    late Map<String, dynamic> userData;
    try {
      _validateEmail(email);
      _validatePassword(password);

      // final Map<String, dynamic> userData =
      // TODO:
      userData = await authServicesAbstract.loginServices(
        email: email,
        password: password,
      );

      // This Method read user data and products.
    } catch (e) {
      print(e);
      rethrow;
    }
    print(UserModel.fromJson(userData, password)..toString());
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
