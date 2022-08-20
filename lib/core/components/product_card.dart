import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/bloc/itemCountCubit/item_count_cubit.dart';
import 'package:la_vie/core/components/button.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';
import 'package:la_vie/model/product.dart';

class ProductCard extends StatelessWidget {
  ProductCard({required this.product,required this.itemCount , Key? key}) : super(key: key);
  //ProductCard(this.name, this.price, this.itemCount, this.imageUrl, {Key? key})
  //    : super(key: key);
/*   String? imageUrl;
  String? name;
  int? price; */
  Product? product;

  ItemCountCubit? itemCount;
  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    double constraintsWidht = MediaQuery.of(context).size.width;
    //itemCount = ItemCountCubit.get(context);
    return BlocConsumer<ItemCountCubit, ItemCountState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: (constraintsWidht / 2) - 25,
                decoration: BoxDecoration(
                  //color: Color.fromARGB(139, 94, 236, 98),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 210, 209, 209),
                      blurRadius: 0.1,
                      offset: Offset(3, 1), // Shadow position
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
              ),
              Positioned(
                bottom: 90,
                left: 10,
                child: (product!.imageUrl != null)
                    ? Image.network(
                        "https://lavie.orangedigitalcenteregypt.com${product!.imageUrl}",
                        width: 80,
                        height: 120,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        "assets/img/plant.png",
                        width: 80,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
              ),
              Positioned(
                  bottom: 33 + (constraintsHeight / 20),
                  left: 7,
                  child: Text(
                    (product!.name!.length > 12)
                        ? "$product!.name!"
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
                        itemCount!.increment();
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
                        "${itemCount!.itemCont}",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        itemCount!.decrement();
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
                    onPress: () {},
                    radius: 15,
                    width: (constraintsWidht / 2) - 40,
                    height: (constraintsHeight / 20),
                    textSize: 11,
                    text: "Add To Cart"),
              )
            ],
          );
        });
  }
}
