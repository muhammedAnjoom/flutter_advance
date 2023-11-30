import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/font.dart';

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