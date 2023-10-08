import './endpoints/api_endpoint.dart';

import '../utils/api/api_services.dart';
import '../utils/exception/network_exception.dart';

abstract class AuthServicesAbstract {
  const AuthServicesAbstract();
  Future<ApiReturnType> loginServices(
      {required String email, required String password});
  Future<void> signUpServices();
  Future<void> updatePassword();
}

class AuthServicesImplement implements AuthServicesAbstract {
  // final ApiServices _apiServices = ApiServices.instance();
  const AuthServicesImplement();

  @override
  Future<ApiReturnType> loginServices({
    required String email,
    required String password,
  }) async {
    ApiServices apiServices = ApiServices.instance();
    return await apiServices.post(
      apiEndPoint: authLocalAPI,
      body: {
        "identifier": email,
        "password": password,
      },
    ).then(
      (response) async {
        apiServices.saveBearer = response['jwt'];
        return await apiServices.read(
          apiEndPoint: authUserDataAPI,
          queryParameters: {'populate': '*'},
        ).catchError(
          (error) =>
              throw CustomNetworkException(errorMessage: error.toString()),
        );
        // return response['user'];
      },
    ).catchError((error) async {
      // print('Error from login services $error');
      // print('Error message is $error');
      print('Error Message from Auth services is ${error.toString()}');

      throw CustomNetworkException(errorMessage: error.toString());
    });
  }

  @override
  Future<void> signUpServices() async {
    // TODO: implement signUpServices
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword() async {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}
