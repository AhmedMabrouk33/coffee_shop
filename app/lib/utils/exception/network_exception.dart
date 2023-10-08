import './error_exception.dart';

class CustomNetworkException extends ErrorException {
  const CustomNetworkException({required super.errorMessage});

  @override
  String get errorExceptionMessage => errorMessage;
}
