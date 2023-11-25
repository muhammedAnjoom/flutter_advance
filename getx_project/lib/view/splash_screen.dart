import 'package:flutter/material.dart';
import 'package:getx_project/res/assets/images_assets.dart';
import 'package:getx_project/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
 SplashServices splashServices = SplashServices();

 @override
  void initState() {
    splashServices.isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 600,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageAssets.SplashScreenImage,
                ),
              ),
            ),
            // child:
          ),
        ],
      ),
    );
  }
}
