import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './routes/app_routes.dart';
import './routes/screen_name.dart' show authScreen;

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoute.appRoutes(),
      debugShowCheckedModeBanner: false,
      title: "Coffee Application",
      initialRoute: authScreen,
    );
  }
}
