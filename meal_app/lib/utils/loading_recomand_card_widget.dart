import 'package:flutter/material.dart';

class RecommendedCardLoding extends StatelessWidget {
  const RecommendedCardLoding({super.key});

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
                  color: Colors.grey[100]),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 90,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[100]),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 200,
                  height: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[100]),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[100]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[100]),
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