import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/colors/app_colors.dart';
import '../../res/components/round_button.dart';
import '../../view_models/controller/login/login_view_model.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key, required this.formKey});
    final loginController = Get.put(LoginViewModel());
    final GlobalKey<FormState> formKey;


  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButton(
          title: "Login",
          loading: loginController.loading.value,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              loginController.loginApi();
            }
          },
          width: 150,
          textColor: AppColor.whitColor,
        ));
  }
}
