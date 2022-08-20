import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/bloc/authCubit/auth_cubit.dart';
import 'package:la_vie/bloc/userCubit/user_cubit.dart';

import '../bloc/app_products/app_products_cubit.dart';
import '../bloc/itemCountCubit/item_count_cubit.dart';
import '../bloc/selectedIndexCubit/selected_index_cubit.dart';
import '../views/splash_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ItemCountCubit()),
          BlocProvider(create: (context) => SelectedIndexCubit()),
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => AppProductsCubit()..getProducts()),
          BlocProvider(create: (context) => UserCubit()..getUser()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplachScreen(),
        ));
  }
}
