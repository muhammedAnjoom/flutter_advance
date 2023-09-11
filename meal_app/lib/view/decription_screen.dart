import 'package:flutter/material.dart';
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
          DraggableScrollableSheet(
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
                      SizedBox(height: 15,),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Ingredients();
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10,);
                        },
                        itemCount: 4,
                      ),
                      SizedBox(height: 20,),
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
