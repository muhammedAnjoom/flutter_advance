import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../../view_models/controller/login/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});
    final loginController = Get.put(LoginViewModel());


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginController.emailController.value,
      focusNode: loginController.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar("Email", "Enter email");
        }
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(
          context,
          loginController.emailFocusNode.value,
          loginController.passwrodFocusNode.value,
        );
      },
      decoration: InputDecoration(
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
