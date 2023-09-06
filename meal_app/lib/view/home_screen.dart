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
              Container(
                decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1630851840633-f96999247032?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: 180,
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.red,
                        width: double.infinity,
                        height: 80,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                            color: Colors.red,
                            child: Text("4.8"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
