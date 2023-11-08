import 'package:flutter/material.dart';
import 'package:getx_project/res/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.loading = false,
    required this.title,
    this.height = 60,
    this.width = 50,
    required this.onPressed,
    this.textColor = AppColor.primaryTextColor,
    this.buttonColor = AppColor.primaryButtonColor,
  });

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPressed;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(50)),
      child: loading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ),
    );
  }
}
