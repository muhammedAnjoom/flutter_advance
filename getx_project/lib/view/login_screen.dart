import 'package:flutter/material.dart';
import 'package:getx_project/res/components/general_expection.dart';
import 'package:getx_project/res/components/internet_expection_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InternetExpectionWidget(onPressed: (){},),
      ),
    );
  }
}