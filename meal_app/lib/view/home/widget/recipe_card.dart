import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal_app/res/colors/app_colors.dart';
import 'package:meal_app/res/fonts/app_fonts.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.image,
    required this.title,
    required this.decription,
  });
  final String image;
  final String title;
  final String decription;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: NetworkImage(image ??
              "https://images.unsplash.com/photo-1630851840633-f96999247032?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: 180,
      height: 220,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.22)),
                  width: double.infinity,
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        style: AppFonts.gPrimaryFont.copyWith(
                          color: AppColor.whitColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "30 MIN",
                            style: AppFonts.gPrimaryFont.copyWith(
                                fontWeight: FontWeight.w100,
                                color: AppColor.whitColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: AppColor.lightOrangeColor,
                            width: 1,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "EASY",
                            style: AppFonts.gPrimaryFont.copyWith(
                              fontWeight: FontWeight.w100,
                              color: AppColor.whitColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      color: AppColor.blackColor.withOpacity(0.12),
                      child: Text(
                        "⭐ 4.8",
                        style: AppFonts.gPrimaryFont.copyWith(
                            color: AppColor.whitColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
