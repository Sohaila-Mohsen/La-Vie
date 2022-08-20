import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/bloc/userCubit/user_cubit.dart';
import 'package:la_vie/core/components/update_user_tile.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';
import 'package:la_vie/core/utils/navigation.dart';
import 'package:la_vie/views/home_screen.dart';
import 'package:la_vie/views/update_user_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = UserCubit.get(context);
    return Scaffold(
        body: BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return (userCubit.user == null)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(userCubit.user!.data!.imageUrl!)),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  color: Colors.black.withOpacity(0.8),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                NavigationUtils.navigateTo(
                                    context: context,
                                    destinationScreen: HomeScreen());
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          IconButton(
                              iconSize: 25,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_horiz_rounded,
                                color: Colors.white,
                                size: 25,
                              )),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                NetworkImage(userCubit.user!.data!.imageUrl!),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                bottom: 0, end: 0),
                            child: CircleAvatar(
                              radius: 13,
                              backgroundColor: AppColors.primaryColorLight,
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${userCubit.user!.data!.firstName!} ${userCubit.user!.data!.lastName!}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 19),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UpdateUserTile(
                                  destinationScreen: null,
                                  color: AppColors.primaryColorLight
                                      .withOpacity(0.12),
                                  imagePath: "assets/img/badge.png",
                                  title:
                                      "You have ${userCubit.user!.data!.userPoints} points"),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  "Edit Profile",
                                  style: AppTextStyle.defultTextStyle(15),
                                ),
                              ),
                              UpdateUserTile(
                                  destinationScreen:
                                      (UpdateUserScreen("name", userCubit)),
                                  title: "Change Name"),
                              UpdateUserTile(
                                  destinationScreen:
                                      UpdateUserScreen("email", userCubit),
                                  title: "Change Email"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    ));
  }
}
