import 'package:flutter/material.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';

import '../style/app_colors/app_colors.dart';

class QuizItem extends StatelessWidget {
  QuizItem({required this.Choice, required this.isSelected, Key? key})
      : super(key: key);
  String Choice;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    double constraintsWidht = MediaQuery.of(context).size.width;
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColorLight),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: constraintsWidht - 100,
              child: Text(
                Choice,
                style: AppTextStyle.defultTextStyle(12),
              ),
            ),
            Container(
              height: 25,
              width: 25,
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColorLight),
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                    color: (isSelected)
                        ? AppColors.primaryColorLight
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ));
  }
}
