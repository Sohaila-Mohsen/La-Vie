import 'package:flutter/material.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';

import '../style/app_text_style/app_text_style.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    double constraintsWidht = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        //color: Color.fromARGB(139, 94, 236, 98),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 210, 209, 209),
            blurRadius: 0.1,
            offset: Offset(5, 1), // Shadow position
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(
              0.0,
              0.0,
            ),
            blurRadius: 16.0,
            spreadRadius: 8.0,
          ),
        ],
      ),
      height: 150,
      width: constraintsWidht,
      child: Row(
        children: [
          Expanded(flex: 2, child: Image.asset("assets/img/plant.png")),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Name", style: AppTextStyle.defultTextStyle(14)),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("50 Egp",
                        style: AppTextStyle.defultTextStyle(
                          12,
                          color: AppColors.primaryColorLight,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 248, 248, 248),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.minimize_rounded,
                              color: AppColors.primaryColorLight,
                            )),
                        Text("1"),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: AppColors.primaryColorLight,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: AppColors.primaryColorLight,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
