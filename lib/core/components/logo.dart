import 'package:flutter/material.dart';

import '../style/app_text_style/app_text_style.dart';

class Logo extends StatelessWidget {
  Logo(this.size, {Key? key}) : super(key: key);
  double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/img/logo.png",width: size,);
  }
}
