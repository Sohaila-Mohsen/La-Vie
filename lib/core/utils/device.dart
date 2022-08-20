import 'package:flutter/widgets.dart';

class Device {
  static bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < 600;
    
  static bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 600;
}
