import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_project/res/routes/routes_name.dart';

class SplashServices {
  void isLogin() {
    Timer(
      const Duration(seconds: 3),
      () => Get.toNamed(RouteName.loginScreen),
    );
  }
}
