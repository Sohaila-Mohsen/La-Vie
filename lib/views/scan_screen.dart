import 'package:flutter/material.dart';
import 'package:la_vie/views/home_screen.dart';


import '../core/utils/navigation.dart';
class ScannerScreen extends StatelessWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          
          /*body: MobileScanner(
              allowDuplicates: false,
              controller: MobileScannerController(
                facing: CameraFacing.back, torchEnabled: false,),
              onDetect: (barcode, args) {
                if (barcode.rawValue == null) {
                  debugPrint('Failed to scan Barcode');
                } else {
                  final String code = barcode.rawValue!;
                  debugPrint(
                      "----------------------------------------------------------------------------------------------");
                  debugPrint('Barcode found! $code');
                  NavigationUtils.navigateAndClearStack(
                      context: context,
                      destinationScreen: HomeScreen());
                  }
              }
          
              
        )*/
    );


  }
}