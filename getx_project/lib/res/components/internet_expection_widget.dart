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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_off,
            color: AppColor.redColor,
            size: 50,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            AppContent.interntMessage,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: widget.onPressed,
            child: Text("Retry"),
          )
        ],
      ),
    );
  }
}
