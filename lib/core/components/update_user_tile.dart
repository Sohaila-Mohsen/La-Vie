import 'package:flutter/material.dart';
import 'package:la_vie/core/utils/navigation.dart';

import '../style/app_text_style/app_text_style.dart';

class UpdateUserTile extends StatelessWidget {
  UpdateUserTile(
      {required this.destinationScreen,
      this.color,
      this.imagePath,
      required this.title,
      Key? key})
      : super(key: key);
  Widget? destinationScreen;
  String title;
  var color;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      decoration: BoxDecoration(
          color: (color != null) ? color : null,
          border: (color == null)
              ? Border.all(color: const Color.fromARGB(255, 201, 201, 201))
              : null,
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: (imagePath == null)
            ? Image.asset("assets/img/update.png")
            : Image.asset(imagePath!),
        title: Text(
          title,
          style: AppTextStyle.defultTextStyle(14),
        ),
        trailing: (color == null) ? const Icon(Icons.arrow_forward) : null,
        onTap: () {
          if (destinationScreen != null)
            NavigationUtils.navigateTo(
                context: context, destinationScreen: destinationScreen!);
        },
      ),
    );
  }
}
