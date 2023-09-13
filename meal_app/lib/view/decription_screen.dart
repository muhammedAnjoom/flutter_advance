import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_app/view/core/font.dart';

import 'widget/Ingedients_card.dart';
import 'widget/emoji_card.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(
                    "assets/icons/left-arrow.svg",
                    width: 50,
                    height: 50,
                    color: Colors.white,
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Stuffed Chicken",
                          style: gPrimaryFont.copyWith(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Ingredients:",
                          style: gPrimaryFont.copyWith(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            EmojiCard(
                              icon: "assets/icons/timer.svg",
                              title: "40 MIN",
                              colors: Colors.green[900]!,
                              backgroundColor: Colors.green.withOpacity(0.50),
                            ),
                            EmojiCard(
                              icon: "assets/icons/emoji.svg",
                              colors: Colors.orange[900]!,
                              backgroundColor: Colors.orange.withOpacity(0.50),
                              title: "MEDIUM",
                            ),
                            EmojiCard(
                              icon: "assets/icons/fire.svg",
                              colors: Colors.blue[800]!,
                              backgroundColor: Colors.blue.withOpacity(0.50),
                              title: "300/cal",
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ListView.separated(
                          controller: scrollController,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Ingredients();
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: 4,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Directions :",
                          style: gPrimaryFont.copyWith(
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
