import 'package:flutter/material.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';

class AppNotification extends StatelessWidget {
  String? notification;
  String? imageUrl;
  String? date;

  AppNotification(
      {required this.imageUrl, required this.notification, this.date, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: CircleAvatar(
                  radius: 24.0,
                  backgroundImage:
                      (imageUrl == null) ? null : NetworkImage(imageUrl!),
                  backgroundColor: AppColors.primaryColorLight,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.defultTextStyle(14),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("15/12/2022", style: AppTextStyle.grayTextStyle(11)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 216, 216, 216),
        ),
      ],
    );
  }
}
