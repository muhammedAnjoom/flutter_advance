import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/font.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Row(
          children: [
            Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1505253758473-96b7015fcd40?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "⭐ 5.0",
                        style: gPrimaryFont.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Muffins With coca\ncream",
                  style: gPrimaryFont.copyWith(
                      fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Text(
                  "By Emma Olivia",
                  style: gPrimaryFont.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "🕢  20 Min",
                      style: gPrimaryFont.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "😄 EASY",
                      style: gPrimaryFont.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}