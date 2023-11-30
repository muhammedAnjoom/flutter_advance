import 'package:flutter/material.dart';
import 'package:meal_app/res/fonts/app_fonts.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //       builder: (ctx) => HomeScreen(),
      //     ),
      //     (route) => false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
        decoration: const BoxDecoration(
            color: Color(0xff42B883),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Text(
          "Get Started",
          style: AppFonts.gPrimaryFont.copyWith(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2),
        ),
      ),
    );
  }
}
