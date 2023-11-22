import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../../view_models/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});
  final loginController = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginController.passwordController.value,
      focusNode: loginController.passwrodFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar("Password", "Enter password");
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
