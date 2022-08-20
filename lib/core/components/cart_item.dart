import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: Image.asset("assets/img/plant.png")),
          Expanded(child: Column(children: [],))

        ],
      ),
    );
  }
}