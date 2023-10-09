import 'package:flutter_test/flutter_test.dart';

// **************** Development Files. ******* /
// * Auth Repositories development file.
import '../../../lib/repositories/auth_repository.dart';

// * Exception development file.
import '../../../lib/utils/exception/auth_exception.dart';
import '../../../lib/utils/exception/network_exception.dart';

// **************** Test Files. ******* /
// * Auth Service test.
import '../services/offline/auth_services_offline_test.dart';

void main() {
  group('Auth repository Login Test', () {
    final AuthRepository authRepository =
        AuthRepository(authServicesAbstract: AuthServicesOfflineImplement());

    test('Invalid Email exception', () async {
      await authRepository
          .loginAction(
              email: 'email', password: 'password', isRememberMe: false)
          // .then((value) => '')
          .catchError(
            (error) => expect(error, isA<RequiredException>()),
          );
    });

    test('Invalid Password exception {Less than 8 characters}', () async {
      await authRepository
          .loginAction(
              email: 'junk@postman.com', password: 'Pass', isRememberMe: false)
          // .then((value) => '')
          .catchError(
            (error) => expect(error, isA<RequiredException>()),
          );
    });

    test('Invalid Password exception {Regular exception error}', () async {
      await authRepository
          .loginAction(
              email: 'junk@postman.com',
              password: 'Password',
              isRememberMe: false)
          // .then((value) => '')
          .catchError(
            (error) => expect(error, isA<ValidationPasswordException>()),
          );
    });

    test('Network exception error', () async {
      await authRepository
          .loginAction(
              email: errorEmail, password: 'Password1234', isRememberMe: false)
          // .then((value) => '')
          .catchError(
            (error) => expect(error, isA<CustomNetworkException>()),
          );
    });

    test('Accepted login Test', () async {
      expectLater(
        authRepository.loginAction(
            email: 'junk@postman.com',
            password: 'Password1234',
            isRememberMe: false),
        isA<Future<void>>(),
      );
    });
  });
}
