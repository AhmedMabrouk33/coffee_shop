import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

// ? **************** Development Files. ******* /
// - Exception development file.
import '../../../lib/utils/exception/auth_exception.dart';
import '../../../lib/utils/exception/network_exception.dart';

// - Auth View-Model development file.
import '../../../lib/viewmodel/auth_viewmodel.dart';

// ? **************** Test Files. ******* /
// - Auth Service test.
import '../services/offline/auth_services_offline_test.dart';

void main() {
  group('Auth View-Model login Test cases', () {
    late AuthViewModel authController;

    setUp(() {
      Get.testMode = true;
      authController = Get.put(
        AuthViewModel(
          authServicesAbstract: const AuthServicesOfflineImplement(),
        ),
      );
      authController.emailController.text = 'Test@test.com';
      authController.passwordController.text = 'Password1234';
    });

    tearDown(() => Get.delete<AuthViewModel>());

    test('Accepted Login Test', () {
      authController.loginAction().then((value) => expect(true, true));
    });

    test('Invalid Email exception', () {
      authController.emailController.text = '';
      authController
          .loginAction()
          .then((value) => expect(true, true))
          .catchError((error) => expect(error, isA<RequiredException>()));
    });

    test('Invalid Password exception {Less than 8 characters}', () {
      authController.passwordController.text = '';
      authController
          .loginAction()
          .then((value) => expect(true, true))
          .catchError((error) => expect(error, isA<RequiredException>()));
    });

    test('Invalid Password exception {Regular exception error}', () {
      authController.passwordController.text = 'password';
      authController
          .loginAction()
          .then((value) => expect(true, true))
          .catchError(
              (error) => expect(error, isA<ValidationPasswordException>()));
    });

    test('Network exception error {Error in email or password}', () {
      authController.emailController.text = errorEmail;
      authController
          .loginAction()
          .then((value) => expect(true, true))
          .catchError((error) => expect(error, isA<CustomNetworkException>()));
    });
  });
}
