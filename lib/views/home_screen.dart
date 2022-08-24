import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/bloc/quizCubit/quiz_cubit.dart';
import 'package:la_vie/bloc/selectedIndexCubit/selected_index_cubit.dart';
import 'package:la_vie/core/components/app_navigation_bar.dart';
import 'package:la_vie/core/components/product_card.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/core/utils/navigation.dart';
import 'package:la_vie/views/my_cart_screen.dart';
import 'package:la_vie/views/quiz_screen.dart';
import 'package:la_vie/views/search_screen.dart';
import 'package:la_vie/views/single_product_screen.dart';
import '../bloc/app_products/app_products_cubit.dart';
import '../bloc/cart_cubit/cart_cubit.dart';
import '../core/components/catecory_title.dart';
import '../core/components/logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    double constraintsWidth = MediaQuery.of(context).size.width;
    AppProductsCubit appProductsCubit = AppProductsCubit.get(context);
    CartCubit cartCubit = CartCubit.get(context);
    //ItemCountCubit itemCountCubit = ItemCountCubit.get(context);
    return Scaffold(
      bottomNavigationBar: const AppNavigationBar(),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {},
          builder: (context, state) {
            return BlocConsumer<AppProductsCubit, AppProductsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return BlocConsumer<AppProductsCubit, AppProductsState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return BlocConsumer<SelectedIndexCubit,
                          SelectedIndexState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Container(
                              padding: const EdgeInsets.only(
                                  top: 59, left: 16, right: 16),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: constraintsWidth / 12,
                                    ),
                                    Logo(100),
                                    (QuizCubit.isWeekPassed())
                                        ? Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                //color: AppColors.primaryColorLight,
                                                border: Border.all(
                                                    color: AppColors
                                                        .primaryColorLight),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: IconButton(
                                                onPressed: () {
                                                  NavigationUtils.navigateTo(
                                                      context: context,
                                                      destinationScreen:
                                                          const QuizScreen());
                                                },
                                                icon: Icon(
                                                  Icons.question_mark_outlined,
                                                  color: AppColors
                                                      .primaryColorLight,
                                                  size: 20,
                                                )),
                                          )
                                        : Container(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            onTap: () {
                                              NavigationUtils.navigateTo(
                                                  context: context,
                                                  destinationScreen:
                                                      SearchScreen(
                                                    products: appProductsCubit
                                                        .productResponse!.data,
                                                  ));
                                            },
                                            readOnly: true,
                                            decoration: const InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.search, size: 25),
                                              errorMaxLines: 5,
                                              hintText: "Search",
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 20, 10, 0),
                                              border: OutlineInputBorder(),
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: AppColors
                                                      .primaryColorLight),
                                              onPressed: () {
                                                // TODO : cart with sql lite
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyCartScreen(
                                                              cartCubit)),
                                                );
                                              },
                                              child: const Icon(
                                                  Icons.shopping_cart_rounded)))
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        appProductsCubit.getProducts();
                                      },
                                      child: CategoryTitle(
                                        "All",
                                        enabeled:
                                            appProductsCubit.selectedCategory ==
                                                0,
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          appProductsCubit.getPlants();
                                        },
                                        child: CategoryTitle(
                                          "Plants",
                                          enabeled: appProductsCubit
                                                  .selectedCategory ==
                                              1,
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          appProductsCubit.getSeeds();
                                        },
                                        child: CategoryTitle(
                                          "Seeds",
                                          enabeled: appProductsCubit
                                                  .selectedCategory ==
                                              2,
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          appProductsCubit.getTools();
                                        },
                                        child: CategoryTitle(
                                          "Tools",
                                          enabeled: appProductsCubit
                                                  .selectedCategory ==
                                              3,
                                        )),
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
                                              top: 25.0, bottom: 280),
                                          child: GridView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            clipBehavior: Clip.none,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    mainAxisSpacing: 70,
                                                    crossAxisSpacing: 5,
                                                    crossAxisCount: 2),
                                            itemCount: appProductsCubit
                                                .products!.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SingleProductScreen(
                                                                product: appProductsCubit
                                                                        .products![
                                                                    index]!),
                                                      ));
                                                },
                                                child: ProductCard(
                                                    productIndex: index,
                                                    cartCubit: cartCubit,
                                                    productsCubit:
                                                        appProductsCubit),
                                              );
                                            },
                                          ),
                                        ),
                                      )
                              ]));
                        },
                      );
                    },
                  );
                });
          },
        ),
      ),
    );
  }
}
