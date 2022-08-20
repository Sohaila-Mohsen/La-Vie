import 'package:flutter/material.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';

class AppLink extends StatelessWidget {
  String text;
  bool? enabeled;
  Function onPress;

  AppLink(
      {required this.text,
      this.enabeled = false,
      required this.onPress,
      Key? key})
      : super(key: key) {
    if (enabeled == null) enabeled = false;
  }
  @override
  Widget build(BuildContext context) {
    return (enabeled!)
        ? Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: AppColors.primaryColorLight,
              width: 3.0,
            ))),
            child: TextButton(
              child: Text(
                "$text",
                style: AppTextStyle.linkTextStyle(15, enabeled!),
              ),
              onPressed: () {
                onPress();
              },
            ),
          )
        : TextButton(
            onPressed: () {
              onPress();
            },
            child: Text(
              "$text",
              style: AppTextStyle.linkTextStyle(15, enabeled!),
            ));
  }
}
