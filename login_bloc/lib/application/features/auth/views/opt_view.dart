import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/application/features/auth/auth_bloc/auth_bloc.dart';
import 'package:login_bloc/application/features/auth/model/user_model.dart';

class OtpRapper extends StatelessWidget {
  const OtpRapper({
    super.key,
    required this.vCode,
  });
  final String vCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: OptView(
        vCode: vCode,
      ),
    );
  }
}

class OptView extends StatelessWidget {
  OptView({
    super.key,
    required this.vCode,
  });
  final String vCode;

  final otpContorller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          });
        }
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("otp"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: otpContorller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "otp"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        OtpSentEvent(
                            otp: otpContorller.text, verficationCode: vCode),
                      );
                    },
                    child: Text("Regsiter"),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
