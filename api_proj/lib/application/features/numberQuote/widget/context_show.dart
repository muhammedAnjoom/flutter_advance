import 'package:flutter/material.dart';

import '../../../core/services/app_fonts.dart';

class ContentCard extends StatelessWidget {
  final String quote;
  const ContentCard({
    super.key,
    required this.quote
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            quote,
            style: AppFonts.titleText,
          ),
        ),
      ),
    );
  }
}