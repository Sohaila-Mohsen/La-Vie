import 'package:flutter/material.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';
import 'package:la_vie/model/product.dart';

class SingleBlogScreen extends StatelessWidget {
  SingleBlogScreen({required this.product, Key? key}) : super(key: key);
  Product? product;
  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    double constraintsWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: constraintsHeight,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 10),
              child: Image.network(
                "https://lavie.orangedigitalcenteregypt.com${product!.imageUrl}",
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${product!.name}",
                          style: AppTextStyle.defultTextStyle(14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${product!.description}",
                        //"description bla bla bla  bla bla bla description bla bla bla bla bla bla description bla bla bla bla bla bla description bla bla bla bla bla bla ",
                        style: AppTextStyle.grayTextStyle(14),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
