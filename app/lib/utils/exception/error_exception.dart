abstract class ErrorException implements Exception {
  final String errorMessage;

  const ErrorException({
    required this.errorMessage,
  });

  String get errorExceptionMessage;
}
