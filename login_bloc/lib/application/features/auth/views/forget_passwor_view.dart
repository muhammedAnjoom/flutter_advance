import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/application/features/auth/auth_bloc/auth_bloc.dart';
import 'package:login_bloc/application/features/auth/views/opt_view.dart';

class FrogetPasswordRapper extends StatelessWidget {
  const FrogetPasswordRapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: RestPassword(),
    );
  }
}

class RestPassword extends StatelessWidget {
  RestPassword({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Enter email to sent code"),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Phone"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(RestPassswordEvent(
                        email: emailController.text, context: context));
                  },
                  child: Text("Send"))
            ],
          ),
        ),
      )),
    );
  }
}
