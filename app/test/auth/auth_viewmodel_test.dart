import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import '../../lib/viewmodel/auth_viewmodel.dart';

import '../../lib/utils/exception/auth_exception.dart';

void main() {
  group('Auth login auth controller', () {
    late AuthViewModel authController;

    setUp(() {
      Get.testMode = true;
      authController = Get.put(AuthViewModel(isTest: true));
    });

    tearDown(() => Get.delete<AuthViewModel>());

    test('Accepted Email and Password', () {
      authController.emailController.text = 'Test@test.com';
      authController.passwordController.text = 'Test1234!';

      authController.loginAction().then((value) => expect(true, true));
    });

    test('Required Email exception check', () async {
      // authController.emailController.text = 'Test@test.com';
      authController.passwordController.text = 'Test1234!';

      await authController
          .loginAction()
          .then((value) => expect(true, false))
          .catchError((error) => expect(error, isA<RequiredException>()));
    });

    test('Required Password exception check', () async {
      authController.emailController.text = 'Test@test.com';
      authController.passwordController.text = '';

      authController
          .loginAction()
          .then((value) => expect(true, false))
          .catchError(
            (error) => expect(error, isA<RequiredException>()),
          );
    });

    test('Validation Password exception check', () async {
      authController.emailController.text = 'Test@test.com';
      authController.passwordController.text = 'testtest!';

      authController
          .loginAction()
          .then((value) => expect(true, false))
          .catchError(
            (error) => expect(error, isA<ValidationPasswordException>()),
          );
    });
  });
}
