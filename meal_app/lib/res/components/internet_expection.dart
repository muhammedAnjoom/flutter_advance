import 'package:flutter/material.dart';
import 'package:meal_app/res/colors/app_colors.dart';

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
            "hello world",
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
