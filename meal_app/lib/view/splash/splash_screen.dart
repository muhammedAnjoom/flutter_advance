import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_app/res/assets/images_assets.dart';
import 'package:meal_app/res/colors/app_colors.dart';
import 'package:meal_app/res/contents/app_contents.dart';
import 'package:meal_app/res/fonts/app_fonts.dart';
import 'package:meal_app/res/routes/route_names.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImageAssets.spalashScreenImage,
              height: 400,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppContent.splashScreenSubTitle,
                      style: AppFonts.gPrimaryFont.copyWith(
                          fontSize: 14,
                          color: AppColor.blackColor,
                          letterSpacing: 1.5),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppContent.splashScreenTitle,
                      style: AppFonts.headingFont.copyWith(
                          height: 1.2, letterSpacing: 1.5, fontSize: 50),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(RouteName.homeScreen),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 18),
                        decoration: const BoxDecoration(
                            color: AppColor.buttonColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Text(
                          "Get Started",
                          style: AppFonts.gPrimaryFont.copyWith(
                              fontSize: 18,
                              color: AppColor.whitColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
