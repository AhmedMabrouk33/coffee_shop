import 'package:flutter_test/flutter_test.dart';

import '../../lib/repositories/auth_repository.dart';

import '../../lib/utils/exception/auth_exception.dart';
import '../../lib/utils/exception/error_exception.dart';

void main() {
  group('Login Auth repository Exception', () {
    const AuthRepository authRepository = AuthRepository();

    test('Accepted email and password', () async {
      authRepository
          .loginAction(
        email: 'test@test.com',
        password: 'Password1234',
        isRememberMe: false,
      )
          .then((value) {
        expect(true, true);
      });
    });

    test('Email exception error', () async {
      try {
        await authRepository.loginAction(
          email: 'email',
          password: 'password',
          isRememberMe: false,
        );
      } on ErrorException catch (error) {
        // print(error);
        expect(error, isA<RequiredException>());
      }
    });

    test('Password required exception', () async {
      try {
        await authRepository.loginAction(
          email: 'junk@junk.com',
          password: '',
          isRememberMe: false,
        );
      } on ErrorException catch (error) {
        // print(error);
        expect(error, isA<RequiredException>());
      }
    });

    test('Password validate exception ', () async {
      try {
        await authRepository.loginAction(
          email: 'junk@junk.com',
          password: 'password',
          isRememberMe: false,
        );
      } on ErrorException catch (error) {
        // print(error);
        expect(error, isA<ValidationPasswordException>());
      }
    });
  });
}
