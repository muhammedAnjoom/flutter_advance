import 'package:flutter/material.dart';
import 'package:getx_project/res/colors/app_colors.dart';
import 'package:getx_project/res/getx_localization.dart/content.dart';

class InternetExpectionWidget extends StatefulWidget {
  const InternetExpectionWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<InternetExpectionWidget> createState() =>
      _InternetExpectionWidgetState();
}

class _InternetExpectionWidgetState extends State<InternetExpectionWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.cloud_off,
            color: AppColor.redColor,
            size: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            AppContent.interntMessage,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: widget.onPressed,
            child: const Text("Retry"),
          )
        ],
      ),
    );
  }
}
