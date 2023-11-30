import 'package:flutter/material.dart';
import 'package:meal_app/view/core/font.dart';

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