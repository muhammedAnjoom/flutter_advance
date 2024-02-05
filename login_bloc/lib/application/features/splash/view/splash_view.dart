import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/application/features/auth/auth_bloc/auth_bloc.dart';

class SplashPageRrapper extends StatelessWidget {
  const SplashPageRrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(CheckLoginStatusEvent(),),
      child: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is Authenticated){
          Navigator.pushReplacementNamed(context,'/home');

        }else if(state is UnAuthenticated){
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/image/splash.jpg"),
              SizedBox(
                height: 50,
              ),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
