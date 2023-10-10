import 'package:flutter_test/flutter_test.dart';

import '../../../../lib/services/auth_services.dart';
import '../../../../lib/utils/api/api_services.dart';
import '../../../../lib/utils/exception/network_exception.dart';

const String errorEmail = 'errorexception@email.com';

class AuthServicesOfflineImplement implements AuthServicesAbstract {
  const AuthServicesOfflineImplement();

  @override
  Future<ApiReturnType> loginServices(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 3));
    if (email != errorEmail) {
      return <String, dynamic>{
        "id": 1,
        "username": "junk",
        "email": email,
        "provider": "local",
        "confirmed": false,
        "blocked": false,
        "createdAt": "2023-10-07T12:34:48.434Z",
        "updatedAt": "2023-10-07T12:37:08.678Z",
        "resetppassword": false,
        "image": 'test'
      };
    } else {
      throw const CustomNetworkException(
          errorMessage: 'Invalid email or password');
    }
  }

  @override
  Future<void> signUpServices() {
    // TODO: implement signUpServices
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword() {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}

void main() {
  group('Auth Services test cases', () {
    const AuthServicesAbstract offlineServices = AuthServicesOfflineImplement();

    test('Test Accepted login Method with dummy user name and password',
        timeout: const Timeout(Duration(minutes: 1)), () async {
      offlineServices
          .loginServices(
            email: 'junk@postman.com',
            password: 'Password1234',
          )
          .then(
            (response) => expect(
              response,
              {
                "id": 1,
                "username": "junk",
                "email": 'junk@postman.com',
                "provider": "local",
                "confirmed": false,
                "blocked": false,
                "createdAt": "2023-10-07T12:34:48.434Z",
                "updatedAt": "2023-10-07T12:37:08.678Z",
                "resetppassword": false,
                "image": 'test'
              },
            ),
          );
    });

    test('Test Network Exception for login Method',
        timeout: const Timeout(Duration(minutes: 1)), () async {
      offlineServices
          .loginServices(
            email: errorEmail,
            password: 'Password1234',
          )
          .then(
            (response) => expect(
              response,
              {
                "id": 1,
                "username": "junk",
                "email": 'junk@postman.com',
                "provider": "local",
                "confirmed": false,
                "blocked": false,
                "createdAt": "2023-10-07T12:34:48.434Z",
                "updatedAt": "2023-10-07T12:37:08.678Z",
                "resetppassword": false,
                "image": 'test'
              },
            ),
          )
          .catchError((error) => expect(error, isA<CustomNetworkException>()));
    });
  });
}
