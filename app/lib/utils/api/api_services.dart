import 'dart:io';

import 'package:dio/dio.dart';

typedef ApiReturnType = Map<String, dynamic>;

class ApiServices {
  static final ApiServices _instance = ApiServices._sharedInstance();

  factory ApiServices.instance() => _instance;

  factory ApiServices.initialize(String baseUrl) {
    // _instance._baseUrl = baseUrl;
    _instance._dio.options.baseUrl = baseUrl;
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
    try {
      var res = await _dio.get(apiEndPoint, queryParameters: queryParameters);

      return res.data;
    } on DioException catch (error) {
      print(' ###################################');

      print(
          ' Is Exception Bad required in Dio Exception error ${error.type == DioExceptionType.badResponse}');

      print('Error message is $error');

      throw error.type == DioExceptionType.badResponse
          ? 'Invalid Email or password'
          : error.type == DioExceptionType.connectionError
              ? 'Please check your internet connection'
              : 'Unknown error';
    }
  }

  Future<ApiReturnType> post({
    required String apiEndPoint,
    required ApiReturnType body,
  }) async {
    try {
      var res = await _dio.post(apiEndPoint, data: body);
      print('Response from end point $apiEndPoint');
      print(res.data);

      return res.data;
    } on DioException catch (error) {
      print(' ###################################');

      print(
          ' Is Exception Bad required in Dio Exception error ${error.type == DioExceptionType.badResponse}');

      print('Error message is $error');

      throw error.type == DioExceptionType.badResponse
          ? 'Invalid Email or password'
          : error.type == DioExceptionType.connectionError
              ? 'Please check your internet connection'
              : 'Unknown error';
    }
  }
}
