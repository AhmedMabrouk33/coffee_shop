import 'package:flutter_test/flutter_test.dart';

import '../../../lib/model/user_model.dart';

void main() {
  group(
    'Test User Model which will receive from API',
    () {
      late UserModel apiUserModel;
      late UserModel tempUserModel;

      setUp(() {
        apiUserModel = UserModel.fromJson(
          {
            "id": 1,
            "username": "junk",
            "email": "junk@postman.com",
            "provider": "local",
            "confirmed": false,
            "blocked": false,
            "createdAt": "2023-10-07T12:34:48.434Z",
            "updatedAt": "2023-10-07T12:37:08.678Z",
            "resetppassword": false,
            "image": 'test'
          },
          'Password1234',
        );

        tempUserModel = const UserModel(
          id: '1',
          userName: 'junk',
          email: 'junk@postman.com',
          password: 'Password1234',
          resetPassword: false,
          image: 'test',
        );
      });

      test(
          'Received User data from API can be change to UserModel object',
          () => expect(apiUserModel, equals(tempUserModel),
              reason: 'The two Users should contain the same data.'));
    },
  );
}
