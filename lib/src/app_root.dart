import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/bloc/authCubit/auth_cubit.dart';
import 'package:la_vie/bloc/userCubit/user_cubit.dart';
import '../bloc/app_products/app_products_cubit.dart';
import '../bloc/cart_cubit/cart_cubit.dart';
import '../bloc/quizCubit/quiz_cubit.dart';
import '../bloc/search_cubit/search_cubit.dart';
import '../bloc/selectedIndexCubit/selected_index_cubit.dart';
import '../core/style/app_colors/app_colors.dart';
import '../views/splash_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SearchCubit()),
          BlocProvider(create: (context) => SelectedIndexCubit()),
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => CartCubit()),
          BlocProvider(create: (context) => QuizCubit()),
          BlocProvider(create: (context) => AppProductsCubit()..getProducts()),
          BlocProvider(create: (context) => UserCubit()..getUser()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: AppColors.primaryColorLight),
          ),
          home: SplachScreen(),
        ));
  }
}
