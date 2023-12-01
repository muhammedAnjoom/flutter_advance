import 'package:flutter/material.dart';
import 'package:meal_app/res/fonts/app_fonts.dart';

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
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            "4 boneless skinless chicken breats kosher salt",
            style: AppFonts.gPrimaryFont.copyWith(
                fontSize: 16,
                color: Colors.grey[800],
                overflow: TextOverflow.ellipsis),
          ),
        )
      ],
    );
  }
}