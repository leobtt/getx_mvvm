import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/login/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  const InputEmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginVM = Get.put(LoginViewModel());
    return TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      decoration: InputDecoration(
        hintText: 'email_hint'.tr,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return Utils.snackBar('Email', 'email_validator'.tr);
        }
        return null;
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(
          context,
          loginVM.emailFocusNode,
          loginVM.passwordFocusNode,
        );
      },
    );
  }
}
