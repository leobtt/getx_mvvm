import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/res/router/routes_name.dart';

class SplashServices {
  isLogin() {
    Timer(
      const Duration(seconds: 3),
      () => Get.toNamed(RouteName.loginView),
    );
  }
}
