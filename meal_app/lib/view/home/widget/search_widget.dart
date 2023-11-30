import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_app/res/assets/icons_assets.dart';
import 'package:meal_app/res/colors/app_colors.dart';
import 'package:meal_app/res/contents/app_contents.dart';
import 'package:meal_app/view/core/font.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          hintText: AppContent.searchTitle,
          hintStyle: gPrimaryFont.copyWith(color: AppColor.search),
          prefixIcon: SvgPicture.asset(
            AppIcons.searchIcons,
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
    );
  }
}
