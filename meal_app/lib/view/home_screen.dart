import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_app/view/core/font.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              SvgPicture.asset(
                "assets/icons/menu.svg",
                width: 25,
                height: 25,
              ),
              SizedBox(height: 20,),
              Text(
                "What would you\nlike ti cook?",
                style: headingFont.copyWith(
                    fontSize: 28, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
