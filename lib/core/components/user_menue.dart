import 'package:flutter/material.dart';
import 'package:la_vie/bloc/authCubit/auth_cubit.dart';
import 'package:la_vie/core/utils/sp_helper/cache_helper.dart';

import '../../views/address_screen.dart';
import '../../views/login_screen.dart';
import '../style/app_colors/app_colors.dart';

class MenueItem {
  final String text;
  final IconData icon;
  const MenueItem({required this.text, required this.icon});
}

class MenueItems {
  MenueItems();
  static const List<MenueItem> menueItems1 = [logout, addAddress];
  static const List<MenueItem> menueItems2 = [logout];

  static const MenueItem logout =
      MenueItem(text: "Logout", icon: Icons.logout_outlined);
  static const MenueItem addAddress =
      MenueItem(text: "Get Free Seeds", icon: Icons.water_drop_outlined);
}

class UserMenue extends StatelessWidget {
  const UserMenue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenueItem>(
      padding: EdgeInsets.all(10),
      icon: Icon(
        Icons.more_horiz_rounded,
        color: Colors.white,
        size: 25,
      ),
      onSelected: (value) => onSelected(context, value),
      itemBuilder: (context) {
        print("object111");
        if (SharedPreferencesHelper.getData(key: "isFirst") == false)
          return [
            ...MenueItems.menueItems2.map(buildItem).toList(),
          ];
        else
          return [
            ...MenueItems.menueItems1.map(buildItem).toList(),
          ];
      },
    );
  }

  PopupMenuItem<MenueItem> buildItem(MenueItem e) {
    print("object");
    return PopupMenuItem<MenueItem>(
        value: e,
        child: Container(
          child: Row(
            children: [
              Icon(
                e.icon,
                color: AppColors.primaryColor,
              ),
              Text(
                e.text,
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: Color.fromARGB(255, 167, 167, 167)),
              )
            ],
          ),
        ));
  }

  onSelected(BuildContext context, MenueItem value) {
    switch (value) {
      case MenueItems.logout:
        AuthCubit.logout();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
        break;
      case MenueItems.addAddress:
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => AddressScreen(
                address: SharedPreferencesHelper.getData(key: "address"),
              ),
            ),
            (route) => false);

        break;
      default:
    }
  }
}
