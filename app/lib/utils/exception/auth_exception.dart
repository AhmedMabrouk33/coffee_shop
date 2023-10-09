import './error_exception.dart';

class RequiredException implements ErrorException {
  final String errorMessage;
  const RequiredException({required this.errorMessage});

  @override
  String get errorExceptionMessage => 'Required $errorMessage field';

  // @override
  // // TODO: implement errorMessage
  // // String get errorMessage => throw UnimplementedError();
}

class ValidationPasswordException implements ErrorException {
  final String errorMessage;
  const ValidationPasswordException({required this.errorMessage});

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