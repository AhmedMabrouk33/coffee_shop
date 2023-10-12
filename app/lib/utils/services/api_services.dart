import 'dart:io';

import 'package:dio/dio.dart';

typedef ApiReturnType = Map<String, dynamic>;

class ApiServices {
  static final ApiServices _instance = ApiServices._sharedInstance();

  factory ApiServices.instance() => _instance;

  factory ApiServices.initialize(String baseUrl) {
    // _instance._baseUrl = baseUrl;
    _instance._dio.options.baseUrl = baseUrl;

    // PRINT: Base url in Api-services in initialize method.
    print('Base url from DIO is ${_instance._dio.options.baseUrl}');
    return _instance;
  }

  ApiServices._sharedInstance();

  // late String _baseUrl;
  // late String _bearer;

  set saveBearer(String jwt) {
    // _bearer = 'Bearer $jwt';
    _dio.options.headers = {
      HttpHeaders.authorizationHeader: 'Bearer $jwt',
      ..._dio.options.headers,
    };
  }

  void removeBearer() =>
      _dio.options.headers.remove(HttpHeaders.authorizationHeader);

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '',
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    ),
  );

  Future<ApiReturnType> read({
    required String apiEndPoint,
    required ApiReturnType? queryParameters,
  }) async {
    return await _dio
        .get(apiEndPoint, queryParameters: queryParameters)
        .then((response) => response.data)
        .onError<DioException>(
      (error, _) {
        // PRINT: Print Get Error message.
        print(' ###################################');

        print(
            ' Is Exception Bad required in Dio Exception error ${error.type == DioExceptionType.badResponse}');

        print(
            ' Is Exception Connection time out in Dio Exception error ${error.type == DioExceptionType.connectionTimeout}');

        print('Error message is $error');

        throw _exceptionHandlerMessage(error.type);
      },
    );
  }

  Future<ApiReturnType> post({
    required String apiEndPoint,
    required ApiReturnType body,
  }) async {
    return await _dio
        .post(apiEndPoint, data: body)
        .then((response) => response.data)
        .onError<DioException>(
      (error, _) {
        // PRINT: Print Get Error message.
        print(' ###################################');

        print(
            ' Is Exception Bad required in Dio Exception error ${error.type == DioExceptionType.badResponse}');

        print(
            ' Is Exception Connection time out in Dio Exception error ${error.type == DioExceptionType.connectionTimeout}');

        print('Error message is $error');

        throw _exceptionHandlerMessage(error.type);
      },
    );
  }

  String _exceptionHandlerMessage(DioExceptionType dioExceptionType) {
    return dioExceptionType == DioExceptionType.badResponse
        ? 'Invalid Email or password'
        : dioExceptionType == DioExceptionType.connectionError
            ? 'Please check your internet connection'
            : dioExceptionType == DioExceptionType.connectionTimeout
                ? 'Server Timeout Error'
                : 'Unknown error';
  }
}
