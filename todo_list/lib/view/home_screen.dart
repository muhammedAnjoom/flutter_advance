import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(color: Color(0xffffe4e4)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
                      width: 60,
                      height: 60,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Shared note",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    Text(
                      "I & You Space",
                      style: TextStyle(
                        fontSize: 34,
                        color: Color(0xff7a2c21),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      // keyboardAppearance: ,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          filled: true,
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                          fillColor: Colors.white,
                          hintText: "Search your notes",
                          suffixIcon: SvgPicture.asset(
                            "assets/icons/search.svg",
                            width: 15,
                            height: 15,
                            fit: BoxFit.scaleDown,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                          hintStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex:1,child: Container(),),
          ],
        ),
      ),
    );
  }
}
