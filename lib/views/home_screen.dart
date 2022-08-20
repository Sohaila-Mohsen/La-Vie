import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/core/components/app_navigation_bar.dart';
import 'package:la_vie/core/components/product_card.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';

import '../bloc/app_products/app_products_cubit.dart';
import '../bloc/itemCountCubit/item_count_cubit.dart';
import '../core/components/catecory_title.dart';
import '../core/components/logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    AppProductsCubit appProductsCubit = AppProductsCubit.get(context);
    return Scaffold(
      bottomNavigationBar: const AppNavigationBar(),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: BlocConsumer<ItemCountCubit, ItemCountState>(
            listener: (context, state) {},
            builder: (context, state) {
              return BlocConsumer<AppProductsCubit, AppProductsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Container(
                      padding:
                          const EdgeInsets.only(top: 59, left: 16, right: 16),
                      child: Column(children: [
                        Logo(100),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoryTitle(
                              "All",
                              enabeled: true,
                            ),
                            CategoryTitle("Plants"),
                            CategoryTitle("Seeds"),
                            CategoryTitle("Tools"),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        (appProductsCubit.products == null)
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColorLight,
                                ),
                              )
                            : Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                height: constraintsHeight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25.0, bottom: 250),
                                  child: GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    clipBehavior: Clip.none,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 70,
                                            crossAxisSpacing: 5,
                                            crossAxisCount: 2),
                                    itemCount:
                                        appProductsCubit.products!.length,
                                    itemBuilder: (context, index) {
                                      ItemCountCubit itemCountCubit =
                                          ItemCountCubit.get(context);

                                      return GestureDetector(
                                        onTap: () {},
                                        child: ProductCard(
                                            itemCount: itemCountCubit,
                                            product: appProductsCubit
                                                .products![index]),
                                      );
                                    },
                                  ),
                                ),
                              )
                      ]));
                },
              );
            }),
      ),
    );
  }
}
