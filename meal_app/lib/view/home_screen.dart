import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_app/view/core/font.dart';
import 'package:meal_app/view/widget/recipe_card.dart';

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
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: "Search for your qurey",
                    hintStyle:
                        gPrimaryFont.copyWith(color: const Color(0xffBEBCAC)),
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/search.svg",
                      color: Color(
                        0xff150F0E,
                      ),
                      width: 30,
                      height: 30,
                      fit: BoxFit.scaleDown,
                    ),
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none),
                    fillColor: const Color(0xffF3F3F3),
                    focusColor: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Today recipe",
                style: gPrimaryFont.copyWith(
                    fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 240,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 5,
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: RecipeCard(),
                    );
                  },
                ),
              ),
              Text("Reat Iteam",style: gPrimaryFont.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w600
              ),)
              // SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
