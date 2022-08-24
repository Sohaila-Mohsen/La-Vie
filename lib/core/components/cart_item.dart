import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/model/product.dart';
import '../../bloc/cart_cubit/cart_cubit.dart';
import '../style/app_text_style/app_text_style.dart';

class CartItem extends StatelessWidget {
  CartItem(this.index, this.cartCubit, {Key? key}) : super(key: key);
  CartCubit cartCubit;
  //Product product;
  int index;
  @override
  Widget build(BuildContext context) {
    double constraintsWidht = MediaQuery.of(context).size.width;

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            //color: Color.fromARGB(139, 94, 236, 98),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 210, 209, 209),
                blurRadius: 0.1,
                offset: Offset(5, 1),
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
              Expanded(
                  flex: 2,
                  child: FadeInImage(
                    image: NetworkImage(
                        "https://lavie.orangedigitalcenteregypt.com${cartCubit.myCart[index].imageUrl}"),
                    placeholder: AssetImage("assets/img/plant.png"),
                  )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${cartCubit.myCart[index].name}",
                          style: AppTextStyle.defultTextStyle(14)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("${cartCubit.myCart[index].price} Egp",
                            style: AppTextStyle.defultTextStyle(
                              12,
                              color: AppColors.primaryColorLight,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 248, 248, 248),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (cartCubit.myCart[index].quantity == 1)
                                    cartCubit.deleteProduct(index);
                                  else
                                    cartCubit.updateQuantityMinus(index);
                                },
                                icon: Icon(
                                  Icons.minimize_rounded,
                                  color: AppColors.primaryColorLight,
                                )),
                            Text("${cartCubit.myCart[index].quantity}"),
                            IconButton(
                                onPressed: () {
                                  cartCubit.updateQuantityPlus(index);
                                },
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
                        onPressed: () {
                          cartCubit.deleteProduct(index);
                        },
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
      },
    );
  }
}
