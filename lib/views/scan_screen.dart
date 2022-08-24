import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';
//import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class ScannerScreen extends StatefulWidget {
  ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool? isDetected;
  _ScannerScreenState() {
    isDetected = false;
  }

  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    double constraintsWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/img/plant2.png")),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.4),
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraintsHeight / 3 + 10,
                  width: constraintsWidth / 2 + 80,
                  padding: EdgeInsets.all(9),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: MobileScanner(
                      allowDuplicates: false,
                      controller: MobileScannerController(
                        facing: CameraFacing.back,
                        torchEnabled: false,
                      ),
                      onDetect: (barcode, args) {
                        if (barcode.rawValue == null) {
                          debugPrint('Failed to scan Barcode');
                        } else {
                          final String code = barcode.rawValue!;
                          debugPrint(
                              "----------------------------------------------------------------------------------------------");
                          debugPrint('Barcode found! $code');
                          setState(() {
                            isDetected = true;
                          });
                        }
                      }),
                ),
                (!isDetected!)
                    ? Container(
                        margin: EdgeInsets.all(30),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(183, 215, 215, 215),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "plant name",
                                    style: AppTextStyle.defultTextStyle(14),
                                  ),
                                  Text(
                                    "plant description",
                                    style: AppTextStyle.defultTextStyle(11),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
