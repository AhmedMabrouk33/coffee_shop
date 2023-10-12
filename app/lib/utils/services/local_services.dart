import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalServices {
  static LocalServices? _instance;

  late SharedPreferences? _prefInstance;
  // =
  //     SharedPreferences.getInstance().then((value) => value);

  factory LocalServices.instance() {
    if (_instance != null) {
    } else {
      initialize();
    }
    return _instance!;
  }

  LocalServices._sharedInstance();

  static Future<void> initialize() async {
    _instance = LocalServices._sharedInstance();
    print('Wait is Start');
    _instance?._prefInstance =
        await SharedPreferences.getInstance().then((value) {
      print('Message from then function');
      return value;
    });
    print('Wait is Finished');
  }

  Map<String, dynamic>? readMap({required String localEndPoint}) {
    String? localData = _prefInstance?.getString(localEndPoint);

    if (localData != null) {
      return jsonDecode(localData) as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  Future<bool> save({
    required String localEndPoint,
    required dynamic data,
  }) async {
    String convertedData = jsonEncode(data);
    return await _prefInstance!
        .setString(localEndPoint, convertedData)
        .then((savedFlag) => savedFlag);
  }

  Future<void> delete({required String localEndPoint}) async {
    await _prefInstance?.remove(localEndPoint);
  }
}
