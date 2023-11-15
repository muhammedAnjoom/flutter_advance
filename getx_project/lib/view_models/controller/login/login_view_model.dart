import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_project/models/login/user_model.dart';
import 'package:getx_project/repository/login_repository/login_respository.dart';
import 'package:getx_project/res/routes/routes_name.dart';
import 'package:getx_project/utils/utils.dart';
import 'package:getx_project/view_models/controller/user_preferences/user_preference_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwrodFocusNode = FocusNode().obs;
  final userPerfences = UserPrefences();
  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };
    print(emailController.value.text);
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true,
        );
        userPerfences.saveUser(userModel).then((value) {
          Get.toNamed(RouteName.homeScreen);
        }).onError((error, stackTrace) {});

        Utils.snackBar('Login', "Login succesfully");
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
