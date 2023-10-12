import 'package:get/get.dart';

import '../utils/exception/auth_exception.dart';

import '../services/auth_services.dart';

import '../model/user_model.dart';

class AuthRepository {
  const AuthRepository({
    this.authServicesAbstract = const AuthServicesImplement(),
  });

  final AuthServicesAbstract authServicesAbstract;

  Future<UserModel?> autoLogin() async {
    try {
      // TODO: Call 
      return await authServicesAbstract.autoLoginServices().then(
        (response) {
          return UserModel.fromJson(response, response['password']);
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<UserModel> loginAction({
    required String email,
    required String password,
    required bool isRememberMe,
  }) async {
    try {
      _validateEmail(email);
      _validatePassword(password);

      // final Map<String, dynamic> userData =
      // TODO:
      return await authServicesAbstract
          .loginServices(
        email: email,
        password: password,
        saveFlag: isRememberMe,
      )
          .then(
        (authResponse) {
          // TODO: Call Save Local FUNC. from Account Services.
          return UserModel.fromJson(authResponse, password);
        },
      );
    } catch (e) {
      // PRINT: Print error message from login action.
      print(e);
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
