import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:meal_app/controller/data.dart';
import 'package:meal_app/view/core/font.dart';
import 'package:meal_app/view/decription_screen.dart';
import 'package:meal_app/view/widget/recipe_card.dart';

import 'widget/recommended_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final itemController = Get.put(MealDB());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MealDB().getMealData();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    itemController.onClose();
  }

  @override
  Widget build(BuildContext context) {
    // print(itemController.categoriesData.length);
    // print("dat is ${data.length}");
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //    await MealDB().getMealData();
    //    print(itemController.categoriesData.length);
    // });
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
                  "What would you\nlike to cook?",
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
                  child: Obx(() => ListView.builder(
                        itemCount: itemController.categoriesData.length,
                        // shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final data = itemController.categoriesData[index];
                          print("no data");
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => DescriptionScreen(
                                      backgroundImage: data.strCategoryThumb,
                                      title: data.strCategory,
                                      decription: data.strCategoryDescription,
                                    ),
                                  ),
                                );
                              },
                              child: RecipeCard(
                                image: data.strCategoryThumb!,
                                title: data.strCategory!,
                                decription: data.strCategoryDescription!,
                              ),
                            ),
                          );
                        },
                      )),
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
                Obx(
                  () => ListView.builder(
                    itemCount: itemController.bottomList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                    //  itemController.bottomList.shuffle();
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
