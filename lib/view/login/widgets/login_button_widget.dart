import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/login/login_view_model.dart';

class LoginButtonWidget extends StatefulWidget {
  const LoginButtonWidget({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final loginVM = Get.put(LoginViewModel());
    return Obx(
      () => RoundButton(
        loading: loginVM.loading.value,
        width: 200,
        title: 'login'.tr,
        onPress: () {
          if (widget.formKey.currentState!.validate()) {
            loginVM.loginApi();
          }
        },
      ),
    );
  }
}
