import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/utils/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

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
      await _api.loginApi(params);
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
