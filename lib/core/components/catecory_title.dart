import 'package:flutter/material.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';

class CategoryTitle extends StatelessWidget {
  CategoryTitle(this.categoryName, {this.enabeled = false, Key? key})
      : super(key: key);
  String? categoryName;
  bool? enabeled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 3),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 242, 242, 242),
        border: Border.all(
            color:
                (enabeled!) ? AppColors.primaryColorLight : Colors.transparent,
            width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "${categoryName}",
        style: AppTextStyle.linkTextStyle(14, enabeled!),
      ),
    );
  }
}
