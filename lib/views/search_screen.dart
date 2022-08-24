import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/bloc/search_cubit/search_cubit.dart';
import 'package:la_vie/core/components/empty_result.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';
import 'package:la_vie/core/utils/navigation.dart';
import 'package:la_vie/core/utils/sp_helper/cache_helper.dart';
import 'package:la_vie/model/product.dart';
import 'package:la_vie/views/search_result_screem.dart';
import 'package:la_vie/views/single_product_screen.dart';

class SearchScreen extends StatelessWidget {
  List<Product>? products;
  List<Product>? displayList;
  List<String>? history;
  final TextEditingController _query = TextEditingController();

  SearchScreen({required this.products, Key? key}) : super(key: key) {
    history = SearchCubit.getUserHistory();
    print("history : ${history!.length}");
    if (products != null) displayList = List.from(products!);
  }

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = SearchCubit.get(context);
    SearchCubit.baseList = products;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (query) {
                  print("object");
                  searchCubit.getResult(query);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchResultScreen(searchCubit, _query.text),
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
            Expanded(
              child: Column(children: [
                (history == null && !searchCubit.clickedSearch)
                    ? const Text(
                        "Recent searchs",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 151, 151, 151)),
                      )
                    : Container(),
                Expanded(
                    child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: history!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        searchCubit.getResult(history![index]);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchResultScreen(
                                  searchCubit, history![index]),
                            ),
                            (route) => false);
                      },
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 2.0),
                        leading: const Icon(Icons.history),
                        title: Text(history![index]),
                      ),
                    );
                  },
                ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}


//-----------------------------------------------------------------------------------------------
/* 
class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
} */
