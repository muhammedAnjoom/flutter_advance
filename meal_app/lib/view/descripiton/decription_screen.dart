import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_app/res/assets/icons_assets.dart';
import 'package:meal_app/res/colors/app_colors.dart';
import 'package:meal_app/res/fonts/app_fonts.dart';

// import 'widget/Ingedients_card.dart';
import 'widget/emoji_card.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen(
      {super.key, this.backgroundImage, this.decription, this.title});

  final String? backgroundImage;
  final String? title;
  final String? decription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            backgroundImage ??
                "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 25,
                      child: SvgPicture.asset(
                        AppIcons.leftArrowIcons,
                        width: 50,
                        height: 50,
                        // color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: .60,
              minChildSize: .3,
              maxChildSize: .6,
              expand: false,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: AppColor.whitColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          title ?? "Stuffed Chicken",
                          style: AppFonts.gPrimaryFont.copyWith(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Ingredients:",
                          style: AppFonts.gPrimaryFont.copyWith(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            EmojiCard(
                              icon: AppIcons.timerIcons,
                              title: "40 MIN",
                              colors: AppColor.greenColor,
                              backgroundColor: Colors.green.withOpacity(0.50),
                            ),
                            EmojiCard(
                              icon: AppIcons.emojiIcons,
                              colors: AppColor.orangeColor,
                              backgroundColor: Colors.orange.withOpacity(0.50),
                              title: "MEDIUM",
                            ),
                            EmojiCard(
                              icon: AppIcons.fireIcons,
                              colors: AppColor.blueColor,
                              backgroundColor: Colors.blue.withOpacity(0.50),
                              title: "300/cal",
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          decription ??
                              "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]",
                          style: AppFonts.gPrimaryFont.copyWith(
                            fontSize: 18,
                          ),
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Directions :",
                          style: AppFonts.gPrimaryFont.copyWith(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
