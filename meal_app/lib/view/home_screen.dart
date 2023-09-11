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
        child: SingleChildScrollView(
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Recommended",
                      style: gPrimaryFont.copyWith(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text(
                      "See All",
                      style: gPrimaryFont.copyWith(
                          color: Colors.black38, fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RecommendedCard();
                  },
                )

                // SizedBox(height: 100,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Row(
          children: [
            Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1505253758473-96b7015fcd40?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "⭐ 5.0",
                        style: gPrimaryFont.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Muffins With coca\ncream",
                  style: gPrimaryFont.copyWith(
                      fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Text(
                  "By Emma Olivia",
                  style: gPrimaryFont.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "🕢  20 Min",
                      style: gPrimaryFont.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "😄 EASY",
                      style: gPrimaryFont.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
