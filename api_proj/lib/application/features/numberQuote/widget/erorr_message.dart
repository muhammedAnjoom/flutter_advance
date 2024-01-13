import 'package:flutter/material.dart';

import '../../../core/services/app_fonts.dart';

class ErrorShowWidget extends StatelessWidget {
  final String message;
  const ErrorShowWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 45,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            message,
            style: AppFonts.primaryText
                .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          )
          // CircularProgressIndicator()
        ],
      ),
    );
  }
}