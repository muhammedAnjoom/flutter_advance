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
              const SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                "assets/icons/menu.svg",
                width: 25,
                height: 25,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "What would you\nlike ti cook?",
                style: headingFont.copyWith(
                    fontSize: 28, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none
                    ),
                    fillColor: Color(0xffF3F3F3),
                    focusColor: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
