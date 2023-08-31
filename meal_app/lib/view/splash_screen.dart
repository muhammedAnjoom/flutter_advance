import 'package:flutter/material.dart';
import 'package:meal_app/view/core/font.dart';

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
              "assets/image/splash_image.jpg",
              height: 400,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "25K+ PREMIUM RECIPES",
                      
                      style: gPrimaryFont.copyWith(fontSize: 14,color: Colors.black54,letterSpacing: 1.5),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "it's\nCooking\nTime!",
                      style: headingFont.copyWith(
                        letterSpacing: 1.5,
                        fontSize: 45
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
