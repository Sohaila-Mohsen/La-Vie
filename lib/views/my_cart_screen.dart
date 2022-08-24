import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/core/components/button.dart';
import 'package:la_vie/core/components/cart_item.dart';
import 'package:la_vie/core/components/empty_result.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';

import '../bloc/cart_cubit/cart_cubit.dart';
import '../core/utils/navigation.dart';
import '../model/product.dart';
import 'home_screen.dart';

class MyCartScreen extends StatefulWidget {
  MyCartScreen(this.cartCubit, {Key? key}) : super(key: key) {
    cartCubit.myCart = [];
    cartCubit.getProducts();
  }
  CartCubit cartCubit;

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();

  @override
  void initState() {}
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    double constraintsWidht = MediaQuery.of(context).size.width;
    return Scaffold(
        body: BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 2, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (widget.cartCubit.myCart.isNotEmpty)
                  ? SizedBox(
                      height: 40,
                    )
                  : Container(),
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
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
              (widget.cartCubit.myCart.isNotEmpty)
                  ? Expanded(
                      //height: 200,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.cartCubit.myCart.length,
                        itemBuilder: (BuildContext context, int index) {
                          print(
                              "from my cart screen ${widget.cartCubit.myCart[index].name}");
                          return CartItem(
                            index,
                            widget.cartCubit,
                          );
                        },
                      ),
                    )
                  : Center(
                      child: EmptyResult(text: "Your cart is empty"),
                    ),
              (widget.cartCubit.myCart.isNotEmpty)
                  ? Container(
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
                                "${widget.cartCubit.total} Egp",
                                style: AppTextStyle.defultTextStyle(12,
                                    color: AppColors.primaryColorLight),
                              )
                            ],
                          ),
                          AppButton(
                              onPress: () {
                                widget.cartCubit.setTotal(0.0);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                    (route) => false);
                              },
                              text: "Checkout")
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ); //-----------
      },
    ) //----
        );
  }
}
//OCD@2021#!