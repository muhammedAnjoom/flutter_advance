import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:meal_app/res/assets/icons_assets.dart';
import 'package:meal_app/res/colors/app_colors.dart';
import 'package:meal_app/res/contents/app_contents.dart';
import 'package:meal_app/res/fonts/app_fonts.dart';
import 'package:meal_app/res/routes/route_names.dart';
import 'package:meal_app/view/descripiton/decription_screen.dart';
import 'package:meal_app/view/home/widget/recipe_card.dart';
import 'package:meal_app/view/home/widget/search_widget.dart';
import 'package:meal_app/view_models/controller/home/home_view_model.dart';

import 'widget/recommended_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final itemController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      itemController.getDataList();
      print(itemController.loading.value);
    });
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
                  AppIcons.menuIcons,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppContent.homeScreenTitle,
                  style: AppFonts.headingFont.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SearchWidget(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Today recipe",
                  style: AppFonts.gPrimaryFont
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return itemController.loading.value == true
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(
                          height: 240,
                          width: double.infinity,
                          child: Obx(() => ListView.builder(
                                itemCount: itemController.categoriesData.length,
                                // shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final data =
                                      itemController.categoriesData[index];
                                  print(itemController.loading.value);

                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RouteName.descripitonScren,
                                            arguments: DescriptionScreen(
                                              backgroundImage:
                                                  data.strCategoryThumb,
                                              title: data.strCategory,
                                              decription:
                                                  data.strCategoryDescription,
                                            ));
                                      },
                                      child: RecipeCard(
                                        image: data.strCategoryThumb!,
                                        title: data.strCategory!,
                                        decription:
                                            data.strCategoryDescription!,
                                      ),
                                    ),
                                  );
                                },
                              )),
                        );
                }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Recommended",
                      style: AppFonts.gPrimaryFont
                          .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "See All",
                      style: AppFonts.gPrimaryFont.copyWith(
                          color: AppColor.blackGreyColor, fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => ListView.builder(
                    itemCount: itemController.bottomList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final meal = itemController.bottomList[index];
                      return RecommendedCard(
                        image: meal.strCategoryThumb,
                        title: meal.strCategory,
                      );
                    },
                  ),
                ),
                // SizedBox(height: 100,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
