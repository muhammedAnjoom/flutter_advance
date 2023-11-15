import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/res/colors/app_colors.dart';
import 'package:getx_project/res/components/general_expection.dart';
import 'package:getx_project/res/components/internet_expection_widget.dart';
import 'package:getx_project/res/components/round_button.dart';
import 'package:getx_project/utils/utils.dart';
import 'package:getx_project/view_models/controller/login/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.put(LoginViewModel());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Login"),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
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
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
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
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() => RoundButton(
                      title: "Login",
                      loading: loginController.loading.value,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          loginController.loginApi();
                        }
                      },
                      width: 150,
                      textColor: AppColor.whitColor,
                    ))
              ],
            ),
          ),
        ));
  }
}
