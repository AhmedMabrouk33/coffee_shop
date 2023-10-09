import './error_exception.dart';

class CustomNetworkException implements ErrorException {
  final String errorMessage;
  const CustomNetworkException({required this.errorMessage});

  @override
  String get errorExceptionMessage => errorMessage;
}
