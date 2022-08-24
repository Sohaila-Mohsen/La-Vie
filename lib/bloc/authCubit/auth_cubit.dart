import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/services/sql_helper.dart';
import 'package:meta/meta.dart';

import '../../core/utils/sp_helper/cache_helper.dart';
import '../../model/auth.dart';
import '../../services/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  var authResponse;

  Future signUp(
      String firstName, String lastName, String email, String password) async {
    await DioHelper.postData(url: "api/v1/auth/signup/", data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    }).then((value) {
      //var jsondata = jsonDecode(token.data);
      authResponse = Auth.fromJson(value.data);
      print('response data  : "${value.data}"');
      SharedPreferencesHelper.saveData(
          key: "accessToken", value: authResponse!.data!.accessToken);
    }).catchError((error) {
      print('error: ${error.toString()}');
    });
  }

  Future signIn(String email, String password) async {
    await DioHelper.postData(
        url: "api/v1/auth/signin/",
        data: {"password": password, "email": email}).then((value) {
      print('response data  : "${value.data}"');
      //var jsondata = jsonDecode(token.data);
      authResponse = Auth.fromJson(value.data);
      print('response data  : "${value.data}"');
      SharedPreferencesHelper.saveData(
          key: "accessToken", value: authResponse!.data!.accessToken);
    }).catchError((error) {
      authResponse = error;
      print('error: ${error.toString()}');
    });
  }

  static logout() {
    SharedPreferencesHelper.removeData(key: "accessToken");
    SQLHelper.deleteItems();
  }
}
