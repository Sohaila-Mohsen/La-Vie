import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/model/product.dart';
import '../../model/blogs.dart';
import '../style/app_text_style/app_text_style.dart';

class BlogItem extends StatelessWidget {
  BlogItem({this.blog, Key? key}) : super(key: key);
  BlogResponse? blog;
  @override
  Widget build(BuildContext context) {
    double constraintsWidht = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
      height: 150,
      width: constraintsWidht,
      child: Row(
        children: [
          Expanded(flex: 2, child: Image.asset("assets/img/plant.png")),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("blog date",
                      style: AppTextStyle.defultTextStyle(11,
                          color: AppColors.primaryColorLight)),
                  Text("blog title", style: AppTextStyle.defultTextStyle(14)),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("blog description",
                        style: AppTextStyle.grayTextStyle(
                          12,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
