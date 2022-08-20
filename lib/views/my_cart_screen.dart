import 'package:flutter/material.dart';
import 'package:la_vie/core/components/button.dart';
import 'package:la_vie/core/components/cart_item.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';

import '../core/utils/navigation.dart';
import 'home_screen.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    double constraintsWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: AppTextStyle.defultTextStyle(11),
                ),
                Text(
                  "500 Egp",
                  style: AppTextStyle.defultTextStyle(12,
                      color: AppColors.primaryColorLight),
                )
              ],
            ),
            AppButton(onPress: () {}, text: "Checkout")
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 50, 2, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      NavigationUtils.navigateTo(
                          context: context,
                          destinationScreen: const HomeScreen());
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    )),
                SizedBox(
                  width: constraintsWidht / 4,
                ),
                Text(
                  "My Cart",
                  style: AppTextStyle.defultTextStyle(16),
                )
              ],
            ),
            Expanded(
              //height: 200,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return CartItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
