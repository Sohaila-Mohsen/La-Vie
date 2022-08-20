import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTextStyle {
  static TextStyle logoTextStyle(double size) => TextStyle(
        fontFamily: 'Meddon',
        fontSize: size,
        fontWeight: FontWeight.w400,
      );
  static TextStyle grayTextStyle(double size) => TextStyle(
      color: const Color.fromARGB(255, 151, 151, 151),
      fontFamily: "Roboto",
      fontSize: size,
      fontWeight: FontWeight.w400);
  static TextStyle defultTextStyle(double size, {Color color = Colors.black}) =>
      TextStyle(
          fontFamily: "Roboto",
          fontSize: size,
          fontWeight: FontWeight.w500,
          color: color);
  static TextStyle labelTextStyle(double size) => TextStyle(
      color: const Color.fromARGB(255, 111, 111, 111),
      fontFamily: "Roboto",
      fontSize: size,
      fontWeight: FontWeight.w500);
  static TextStyle linkTextStyle(double size, bool enabeled) => TextStyle(
      color: (enabeled)
          ? Color.fromARGB(255, 26, 188, 0)
          : const Color.fromARGB(255, 138, 138, 138),
      fontFamily: "Roboto",
      fontSize: size,
      fontWeight: FontWeight.w400);
  static TextStyle buttonTextStyle(double size) => TextStyle(
      color: Colors.white,
      fontSize: size,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500);
}
