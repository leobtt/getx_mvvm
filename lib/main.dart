import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/getx_location/languages.dart';
import 'package:getx_mvvm/res/router/routes.dart';
import 'package:getx_mvvm/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      translations: Languages(),
      locale: const Locale('pt', 'BR'),
      fallbackLocale: const Locale('pt', 'BR'),
      home: const SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
