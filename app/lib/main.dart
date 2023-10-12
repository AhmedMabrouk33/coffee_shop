import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './utils/theme/dark_theme.dart';

import './routes/app_routes.dart';
import './routes/screen_name.dart' show authScreen;

import './utils/services/api_services.dart';
import './services/endpoints/api_endpoint.dart' show baseUrlAPI;

void main() {
  ApiServices.initialize(baseUrlAPI);
  // runApp(const MainApp());
  runApp(
    GetMaterialApp(
      theme: customDarkTheme,
      getPages: AppRoute.appRoutes(),
      debugShowCheckedModeBanner: false,
      title: "Coffee Application",
      initialRoute: authScreen,
    ),
  );
}

/*
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ApiServices.initialize(baseUrlAPI);
    return GetMaterialApp(
      theme: customDarkTheme,
      getPages: AppRoute.appRoutes(),
      debugShowCheckedModeBanner: false,
      title: "Coffee Application",
      initialRoute: authScreen,
    );
  }
}*/
