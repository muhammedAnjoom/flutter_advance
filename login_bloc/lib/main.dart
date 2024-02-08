// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_bloc/application/features/auth/model/user_model.dart';
import 'package:login_bloc/application/features/auth/views/login_view.dart';
import 'package:login_bloc/application/features/auth/views/phone_register.dart';
import 'package:login_bloc/application/features/auth/views/user_register_view.dart';
import 'package:login_bloc/application/features/home/view/home_)view.dart';
import 'package:login_bloc/firebase_options.dart';

import 'application/features/auth/views/opt_view.dart';
import 'application/features/splash/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPageRrapper(),
        '/login': (context) => LoginRapper(),
        '/home': (context) => HomeRapper(),
        '/register': (context) => UserRegisterRapper(),
        '/phoneLogin': (context) => PhoneRapper(),
      },
    );
  }
}
