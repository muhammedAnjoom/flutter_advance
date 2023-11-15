import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_project/res/routes/routes_name.dart';
import 'package:getx_project/view_models/controller/user_preferences/user_preference_view_model.dart';

class SplashServices {
  UserPrefences userPrefences = UserPrefences();
  void isLogin() {
    userPrefences.getUser().then((value) {
      if (value.isLogin == false|| value.isLogin.toString() == 'null') {
        Timer(
          const Duration(seconds: 3),
          () => Get.toNamed(RouteName.loginScreen),
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () => Get.toNamed(RouteName.homeScreen),
        );
      }
    });
  }
}
