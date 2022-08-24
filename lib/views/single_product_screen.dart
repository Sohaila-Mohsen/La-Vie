import 'package:flutter/material.dart';
import 'package:la_vie/bloc/search_cubit/search_cubit.dart';
import 'package:la_vie/bloc/userCubit/user_cubit.dart';
import 'package:la_vie/core/components/button.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/views/home_screen.dart';
import 'package:la_vie/views/search_screen.dart';
import '../core/style/app_text_style/app_text_style.dart';
import '../model/product.dart';

class SingleProductScreen extends StatelessWidget {
  SingleProductScreen({required this.product, Key? key}) : super(key: key);
  Product product;
  UserCubit? userCubit;
  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    userCubit = UserCubit.get(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://lavie.orangedigitalcenteregypt.com${product.imageUrl}")),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(22),
              margin: const EdgeInsets.all(13),
              height: constraintsHeight / 2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(
                          "https://lavie.orangedigitalcenteregypt.com${product.imageUrl}"),
                    ),
                  ),
                  Center(
                    child: Text(
                      product.type!.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: "Poppins",
                          fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("${product.name}",
                      style: AppTextStyle.defultTextStyle(
                        17,
                        color: AppColors.primaryColor,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Poppins",
                            fontSize: 12),
                      ),
                      Text("${product.description}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${product.price} Egp"),
                    ],
                  ),
                  AppButton(
                    onPress: () {},
                    text: "Add To Cart",
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        SearchCubit.clearSearch();
                        SearchCubit.saveToHistory(product.name!);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                            (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 206, 206, 206),
                      ),
                      child: Text(
                        "Go Back",
                        style: AppTextStyle.defultTextStyle(14,
                            color: Colors.grey),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
