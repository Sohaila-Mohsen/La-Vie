import 'package:flutter/material.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';

class EmptyResult extends StatelessWidget {
  EmptyResult({required this.text, Key? key}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: constraintsHeight / 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/img/not found.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            text,
            style: AppTextStyle.grayTextStyle(14),
          )
        ],
      ),
    );
  }
}
