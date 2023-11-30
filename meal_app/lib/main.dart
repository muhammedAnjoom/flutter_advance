import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_app/res/routes/routes.dart';
import 'package:meal_app/view/descripiton/decription_screen.dart';
import 'package:meal_app/view/home/home_screen.dart';
import 'package:meal_app/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      getPages: AppRoute.appRoute(),
    );
  }
}


