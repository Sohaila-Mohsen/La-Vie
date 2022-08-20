import 'package:flutter/material.dart';

import '../style/app_text_style/app_text_style.dart';

class LineTextLine extends StatelessWidget {
  LineTextLine(this.text, {this.size = 12 ,  Key? key}) : super(key: key);
  String? text;
  double? size;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Expanded(
          child: Divider(
        color: Color.fromARGB(255, 151, 151, 151),
        thickness: 1,
      )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Text(
          text!,
          style: AppTextStyle.grayTextStyle(size!),
        ),
      ),
      const Expanded(
          child: Divider(
        color: Color.fromARGB(255, 151, 151, 151),
        thickness: 1,
      )),
    ]);
  }
}
