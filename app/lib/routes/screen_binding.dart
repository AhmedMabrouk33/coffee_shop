import 'package:get/get.dart';

import '../viewmodel/auth_viewmodel.dart';

class AuthPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<AuthViewModel>(() => AuthViewModel());
}
