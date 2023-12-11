
import 'package:flutter/material.dart';

class SketlonWidget extends StatelessWidget {
  const SketlonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}