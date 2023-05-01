import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/router/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  final userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  final RxBool loading = false.obs;

  void loginApi() async {
    try {
      loading.value = true;
      Map params = {
        'email': emailController.value.text,
        'password': passwordController.value.text,
      };

      var data = await _api.loginApi(params);
      await userPreference.saveUser(UserModel.fromJson(data));

      Get.toNamed(RouteName.homeView);

      Utils.snackBar('Login', 'Login successfully');
      loading.value = false;
    } catch (err, stackTrace) {
      loading.value = false;
      Utils.snackBar('', err.toString());
    }

    /* loading.value = true;
    Map params = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };

    _api.loginApi(params).then((value) {
      loading.value = false;
      Utils.snackBar('Login', 'Login successfully');
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    }); */
  }
}
