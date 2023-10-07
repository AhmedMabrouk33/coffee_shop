import 'package:flutter_test/flutter_test.dart';

abstract class ErrorException1 implements Exception {
  final String fieldMessage;

  const ErrorException1({
    required this.fieldMessage,
  });

  String exceptionMessage();
}

class EmailExceptionError1 extends ErrorException1 {
  const EmailExceptionError1({
    required super.fieldMessage,
  });

  @override
  String exceptionMessage() => 'Error field message is $fieldMessage';
}

// class PasswordExceptionError implements ErrorException {
//   @override
//   String get exceptionMessage => 'Password is required';
// }

void createEmailException() {
  // throw 'EmailExceptionError()';
  throw const EmailExceptionError1(fieldMessage: 'Passed field');
}

void main() {
  test('Email Error exception handler', () {
    try {
      createEmailException();
    } on ErrorException1 catch (err) {
      print(err.exceptionMessage());
    } catch (err) {
      print(err);
    }
  });

  test('Password Error exception handler', () {
    expect(createEmailException, throwsA(isA<EmailExceptionError1>()));
  });

  // test('Password Error exception handler', () {
  //   expect(createEmailException, throwsA(isA<PasswordExceptionError>()));
  // });
}
