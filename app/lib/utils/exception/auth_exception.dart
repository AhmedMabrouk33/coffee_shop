import './error_exception.dart';

class RequiredException extends ErrorException {
  const RequiredException({required super.errorMessage});

  @override
  String get errorExceptionMessage => 'Required $errorMessage field';
}

class ValidationPasswordException extends ErrorException {
  const ValidationPasswordException({required super.errorMessage});

  @override
  String get errorExceptionMessage => 'Error in Password is $errorMessage';
}

/*
class ErrorEmailException extends ErrorException {
  const ErrorEmailException({required super.errorMessage});

  @override
  // String errorExceptionMessage(String error) => 'Email Entry Error';
  
  @override
  // TODO: implement errorMessage
  String get errorMessage => throw UnimplementedError();
}
*/
/*
class ValidationPasswordException extends ErrorException {
  @override
  String errorExceptionMessage(String error) => 'Password is required';
}
*/