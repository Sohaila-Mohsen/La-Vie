import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/bloc/app_products/app_products_cubit.dart';
import 'package:la_vie/core/components/button.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';
import 'package:la_vie/core/utils/navigation.dart';
import 'package:la_vie/model/product.dart';
import 'package:la_vie/views/my_cart_screen.dart';

import '../../bloc/cart_cubit/cart_cubit.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {required this.productsCubit,
      required this.cartCubit,
      required this.productIndex,
      Key? key})
      : super(key: key) {
    this.product = productsCubit!.products![productIndex];
  }
  Product? product;

  int productIndex;
  CartCubit? cartCubit;
  AppProductsCubit? productsCubit;
  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    double constraintsWidht = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          print("imageurl:${product!.imageUrl}");
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: (constraintsWidht / 2) - 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(5, 7))
                ],
              ),
            ),
            Positioned(
              bottom: 90,
              left: 10,
              child: Image.network(
                "https://lavie.orangedigitalcenteregypt.com${product!.imageUrl}",
                width: 80,
                height: 120,
                fit: BoxFit.contain,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset("assets/img/plant.png");
                },
              ),
            ),
            Positioned(
                bottom: 33 + (constraintsHeight / 20),
                left: 7,
                child: Text(
                  (product!.name!.length > 12)
                      ? "${product!.name!}"
                      : "${product!.name! /*.substring(0, 7)}..*/}",
                  style: AppTextStyle.defultTextStyle(12),
                )),
            Positioned(
                bottom: 15 + (constraintsHeight / 20),
                left: 7,
                child: Text(
                  "${product!.price} EGP",
                  style: AppTextStyle.grayTextStyle(10),
                )),
            Positioned(
              right: 10,
              top: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      productsCubit!.updatePlantPlus(productIndex);
                    },
                    child: Container(
                      color: Color.fromARGB(200, 237, 237, 237),
                      height: 22,
                      width: 22,
                      child: Image.asset("assets/img/plus.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "${product!.quantity}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      productsCubit!.updatePlantMinus(productIndex);
                    },
                    child: Container(
                      color: Color.fromARGB(200, 237, 237, 237),
                      height: 22,
                      width: 22,
                      child: Image.asset("assets/img/minus.png"),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 5,
              left: 7,
              child: AppButton(
                  onPress: () {
                    cartCubit!
                        .addProduct(product!, quantity: product!.quantity);
                    print("added from component");
                  },
                  radius: 15,
                  width: (constraintsWidht / 2) - 40,
                  height: (constraintsHeight / 20),
                  textSize: 11,
                  text: "Add To Cart"),
            )
          ],
        ));
  }
}
