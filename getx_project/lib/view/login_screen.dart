import 'package:flutter/material.dart';
import 'package:getx_project/view/widget/input_email_widget.dart';
import 'package:getx_project/view/widget/input_password_widget.dart';
import 'package:getx_project/view/widget/login_button.dart';

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
