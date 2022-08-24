import 'package:flutter/material.dart';
import 'package:la_vie/bloc/search_cubit/search_cubit.dart';
import 'package:la_vie/views/search_screen.dart';
import 'package:la_vie/views/single_product_screen.dart';

import '../core/components/empty_result.dart';
import '../core/style/app_colors/app_colors.dart';
import '../core/style/app_text_style/app_text_style.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen(this.searchCubit, this.query, {Key? key})
      : super(key: key);
  SearchCubit searchCubit;
  String query;
  final TextEditingController _query = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.all(3),
              child: TextFormField(
                controller: _query,
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          products: SearchCubit.baseList,
                        ),
                      ),
                      (route) => false);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 245, 245, 245),
                  hintText: "Searsh",
                  hintStyle: const TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 151, 151, 151)),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 187, 187, 187),
                  ),
                ),
              ),
            ),
            (SearchCubit.searchResult == null ||
                    SearchCubit.searchResult!.isEmpty)
                ? Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text("Result for \""),
                          Text(
                            query,
                            style: AppTextStyle.defultTextStyle(14,
                                color: AppColors.primaryColor),
                          ),
                          const Text("\""),
                          const Expanded(
                              child: const SizedBox(
                            width: 2,
                          )),
                          Text(
                            "0 found",
                            style: AppTextStyle.defultTextStyle(14,
                                color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                      Center(
                        child: EmptyResult(text: "Not Found"),
                      ),
                    ],
                  )
                : Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: SearchCubit.searchResult!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SingleProductScreen(
                                    product: SearchCubit.searchResult![index],
                                  ),
                                ),
                                (route) => false);
                          },
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5.0),
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://lavie.orangedigitalcenteregypt.com${SearchCubit.searchResult![index].imageUrl}")),
                          title: Text(SearchCubit.searchResult![index].name!),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
