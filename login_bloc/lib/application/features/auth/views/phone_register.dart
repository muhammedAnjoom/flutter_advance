import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/application/features/auth/auth_bloc/auth_bloc.dart';
import 'package:login_bloc/application/features/auth/views/opt_view.dart';

class PhoneRapper extends StatelessWidget {
  const PhoneRapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: PhoneRegister(),
    );
  }
}

class PhoneRegister extends StatelessWidget {
  PhoneRegister({super.key});

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is PhoneVerfiedState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (ctx) => OtpRapper(
                          vCode: state.verficationCode,
                        )),
                (route) => false);
          });
        }

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
                  Text("Phone Register"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Phone"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final data = phoneController.text;
                        BlocProvider.of<AuthBloc>(context)
                            .add(PhoneNumberLoginEvent(phone: data));
                      },
                      child: Text("Send"))
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
