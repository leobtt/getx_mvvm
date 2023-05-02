import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  const InputPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginVM = Get.put(LoginViewModel());
    return TextFormField(
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscureText: true,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: 'password_hint'.tr,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return Utils.snackBar(
            'password_name'.tr,
            'password_validator'.tr,
          );
        }
        return null;
      },
    );
  }
}
