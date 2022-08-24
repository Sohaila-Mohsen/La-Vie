import 'package:flutter/material.dart';
import 'package:la_vie/core/components/blog_item.dart';
import 'package:la_vie/views/single_blog_screen.dart';

import '../core/style/app_text_style/app_text_style.dart';
import '../core/utils/navigation.dart';
import '../model/product.dart';
import 'home_screen.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    double constraintsWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 10),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
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
                    "Blogs",
                    style: AppTextStyle.defultTextStyle(16),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(bottom: 80),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                height: constraintsHeight,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            NavigationUtils.navigateTo(
                                context: context,
                                destinationScreen: SingleBlogScreen(product: Product(),));
                          },
                          child: BlogItem());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
