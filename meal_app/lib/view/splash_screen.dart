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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "25K+ PREMIUM RECIPES",
                      
                      style: gPrimaryFont.copyWith(fontSize: 14,color: Colors.black54,letterSpacing: 1.5),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      "it's\nCooking\nTime!",
                      style: headingFont.copyWith(
                        height: 1.2,
                        
                        letterSpacing: 1.5,
                        fontSize: 50
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 18),
                      decoration: BoxDecoration(
                        color: Color(0xff42B883),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                        
                      ),
                      child: Text("Get Started",style: gPrimaryFont.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2
                      ),),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
