import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/res/colors/app_colors.dart';
import 'package:getx_project/res/components/general_expection.dart';
import 'package:getx_project/res/components/internet_expection_widget.dart';
import 'package:getx_project/res/components/round_button.dart';
import 'package:getx_project/utils/utils.dart';
import 'package:getx_project/view/widget/input_email_widget.dart';
import 'package:getx_project/view/widget/input_password_widget.dart';
import 'package:getx_project/view/widget/login_button.dart';
import 'package:getx_project/view_models/controller/login/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Login"),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding:const  EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputEmailWidget(),
                const SizedBox(
                  height: 20,
                ),
                InputPasswordWidget(),
                const SizedBox(
                  height: 20,
                ),
                LoginButton(
                  formKey: _formKey,
                )
              ],
            ),
          ),
        ));
  }
}
