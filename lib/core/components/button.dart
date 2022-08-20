import 'package:flutter/material.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';

import '../style/app_colors/app_colors.dart';

class AppButton extends StatelessWidget {
  Function onPress;
  String text;
  double? width;
  double? height;
  double? textSize;
  double? radius;
  AppButton(
      {Key? key,
      required this.onPress,
      required this.text,
      this.width,
      this.height = 50,
      this.textSize = 14,
      this.radius = 5})
      : super(key: key) {
    if (width == null) {
      width = double.infinity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          //color: AppColors.primaryColorLight
        ),
        child: ElevatedButton(
          onPressed: () {
            onPress();
          },
          style: ElevatedButton.styleFrom(
              primary: AppColors.primaryColorLight,
              fixedSize: Size(width!, height!)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppTextStyle.buttonTextStyle(textSize!),
              ),
            ],
          ),
        ));
  }
}
