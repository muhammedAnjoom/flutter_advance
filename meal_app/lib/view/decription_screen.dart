import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_app/view/core/font.dart';

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
          SizedBox.expand(
            child: DraggableScrollableSheet(
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
                            EmojiCard(icon: "assets/icons/fire.svg", colors: Colors.blue[800]!, backgroundColor: Colors.blue.withOpacity(0.50), title: "300/cal")
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ListView.separated(
                          controller: scrollController,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
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

class EmojiCard extends StatelessWidget {
  const EmojiCard({
    super.key,
    required this.icon,
    required this.colors,
    required this.backgroundColor,
    required this.title,
  });

  final String icon;
  final Color colors;
  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              icon,
              width: 60,
              height: 60,
            ),
          ),
          Text(
            title,
            style: gPrimaryFont.copyWith(fontSize: 16, color: colors),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class Ingredients extends StatelessWidget {
  const Ingredients({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: Colors.amber[800],
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            "4 boneless skinless chicken breats kosher salt",
            style: gPrimaryFont.copyWith(
                fontSize: 16,
                color: Colors.grey[800],
                overflow: TextOverflow.ellipsis),
          ),
        )
      ],
    );
  }
}
