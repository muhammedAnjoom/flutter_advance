import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LoginViewModel extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwrodFocusNode  = FocusNode().obs;
}
