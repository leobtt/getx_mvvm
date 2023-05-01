import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('login'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
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
                  },
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                      context,
                      loginVM.emailFocusNode,
                      loginVM.passwordFocusNode,
                    );
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
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
                  },
                ),
              ]),
            ),
            const SizedBox(height: 40),
            Obx(
              () => RoundButton(
                loading: loginVM.loading.value,
                width: 200,
                title: 'login'.tr,
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    loginVM.loginApi();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
