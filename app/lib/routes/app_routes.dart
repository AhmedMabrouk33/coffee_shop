import 'package:get/get.dart';

import './screen_name.dart';
import './screen_binding.dart';

import '../views/auth_view.dart';

class AppRoute {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: authScreen,
        page: () => const AuthScreen(),
        binding: AuthPageBinding(),
        popGesture: false,
      ),
    ];
  }
}
