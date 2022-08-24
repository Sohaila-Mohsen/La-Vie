import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/bloc/userCubit/user_cubit.dart';
import 'package:la_vie/core/components/app_navigation_bar.dart';
import 'package:la_vie/core/components/app_notification.dart';
import 'package:la_vie/core/components/empty_result.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = UserCubit.get(context);
    return Scaffold(
        bottomNavigationBar: AppNavigationBar(),
        body: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.only(top: 50, left: 10),
              child: Column(
                children: [
                  Text(
                    "Notification",
                    style: AppTextStyle.defultTextStyle(19),
                  ),
                  (userCubit.user == null)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : (userCubit.user!.data!.userNotification == null ||
                              userCubit
                                  .user!.data!.userNotification!.isNotEmpty)
                          ? Expanded(
                              child: ListView.builder(
                                  itemCount: userCubit
                                      .user!.data!.userNotification!.length,
                                  itemBuilder: (context, index) {
                                    return AppNotification(
                                        imageUrl:
                                            userCubit.user!.data!.imageUrl,
                                        notification: userCubit.user!.data!
                                            .userNotification![index]);
                                  }),
                            )
                          : Center(
                              child:
                                  EmptyResult(text: "No Notification to View"),
                            ),
                ],
              ),
            );
          },
        ));
  }
}
