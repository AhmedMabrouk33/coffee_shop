// - Endpoints.
import './endpoints/api_endpoint.dart';
import './endpoints/local_endpoint.dart';

// - Services
import '../utils/services/api_services.dart';
import '../utils/services/local_services.dart';

// - Exception.
import '../utils/exception/network_exception.dart';

abstract class AuthServicesAbstract {
  const AuthServicesAbstract();
  Future<ApiReturnType> loginServices({
    required String email,
    required String password,
    required bool saveFlag,
  });

  Future<ApiReturnType> autoLoginServices();
  Future<void> signUpServices();
  Future<void> updatePassword();
}

class AuthServicesImplement implements AuthServicesAbstract {
  // final ApiServices _apiServices = ApiServices.instance();
  const AuthServicesImplement();

  void _saveBearerSharedPreferences({
    required String jwt,
    required String email,
    required String password,
  }) {
    LocalServices.instance().save(
      localEndPoint: authLocalEndPoint,
      data: {
        'jwt': jwt,
        'email': email,
        'password': password,
        'jwtExpiredData':
            DateTime.now().add(const Duration(minutes: 1)).toIso8601String(),
      },
    );
  }

  @override
  Future<ApiReturnType> autoLoginServices() async {
    // TODO: implement autoLoginServices
    throw UnimplementedError();
  }

  @override
  Future<ApiReturnType> loginServices({
    required String email,
    required String password,
    required bool saveFlag,
  }) async {
    ApiServices apiServices = ApiServices.instance();

    // TODO: can datatime encode and decode in flutter write in chat-GPT.
    // TODO: Convert to Try and catch Method.

    try {
      ApiReturnType response = await apiServices.post(
        apiEndPoint: authLocalAPI,
        body: {
          "identifier": email,
          "password": password,
        },
      );

      apiServices.saveBearer = response['jwt'];

      saveFlag
          ? _saveBearerSharedPreferences(
              email: email,
              password: password,
              jwt: response['jwt'],
            )
          : null;

      return await apiServices.read(
        apiEndPoint: authUserDataAPI,
        queryParameters: {'populate': '*'},
      );
    } catch (error) {
      throw CustomNetworkException(errorMessage: error.toString());
    }
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
/*

*/