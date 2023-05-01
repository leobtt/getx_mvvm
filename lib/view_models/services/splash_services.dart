import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/res/router/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  isLogin() async {
    try {
      final user = await userPreference.getUser();

      print('${user.isLogin} --- ${user.token}');

      if (user.isLogin == false || user.isLogin == null) {
        Timer(
          const Duration(seconds: 3),
          () => Get.toNamed(RouteName.loginView),
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () => Get.toNamed(RouteName.homeView),
        );
      }
    } catch (e) {}
  }
}
