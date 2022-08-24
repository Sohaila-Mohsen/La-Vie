import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/bloc/selectedIndexCubit/selected_index_cubit.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/core/utils/custom_icons.dart';
import 'package:la_vie/views/address_screen.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:la_vie/views/blogs_screen.dart';
import 'package:la_vie/views/home_screen.dart';
import 'package:la_vie/views/scan_screen.dart';
import '../../views/notification_screen.dart';
import '../../views/profile_screen.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Function> actions = [
      () {
        
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) =>  AddressScreen()),
            (route) => false);
      },
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScannerScreen()),
        );
      },
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      },
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NotificationScreen()),
            (route) => false);
      },
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
            (route) => false);
      },
    ];
    SelectedIndexCubit selectedIndexCubit = SelectedIndexCubit.get(context);
    return BlocConsumer<SelectedIndexCubit, SelectedIndexState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CurvedNavigationBar(
          index: selectedIndexCubit.selectedIndex!,
          height: 60,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          buttonBackgroundColor: AppColors.primaryColorLight,
          color: const Color.fromARGB(167, 234, 233, 233),
          items: [
            Icon(
              MyFlutterApp.leave,
              color: (selectedIndexCubit.selectedIndex == 0)
                  ? Colors.white
                  : Colors.black,
            ),
            Icon(
              MyFlutterApp.scan,
              color: (selectedIndexCubit.selectedIndex == 1)
                  ? Colors.white
                  : Colors.black,
            ),
            Icon(
              MyFlutterApp.home,
              color: (selectedIndexCubit.selectedIndex == 2)
                  ? Colors.white
                  : Colors.black,
            ),
            Icon(
              MyFlutterApp.bell,
              color: (selectedIndexCubit.selectedIndex == 3)
                  ? Colors.white
                  : Colors.black,
            ),
            Icon(
              MyFlutterApp.profile,
              color: (selectedIndexCubit.selectedIndex == 4)
                  ? Colors.white
                  : Colors.black,
            ),
          ],
          onTap: (index) {
              if(index == 2 || index == 3)
              selectedIndexCubit.changeIndex(index);
              else
                selectedIndexCubit.changeIndex(2);
            actions[index]();
          },
        );
      },
    );
  }
}
