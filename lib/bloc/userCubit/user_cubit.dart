import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/model/user_response.dart';
import 'package:meta/meta.dart';

import '../../core/utils/sp_helper/cache_helper.dart';
import '../../model/auth.dart';
import '../../services/dio_helper.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  UserResponse? user;

  Future<User?> getUser() async {
    await DioHelper.getData(
            url: "api/v1/user/me/",
            token: SharedPreferencesHelper.getData(key: "accessToken"))
        .then((value) {
      emit(LoadingState());
      print('user data  : "${value.data}"');
      user = UserResponse.fromJson(value.data);
      emit(GotUserSuccessfuly());
      return user!.data;
    }).catchError((error) {
      print('error: ${error.toString()}');
      emit(ErrorState());
    });
  }

  void logout() {
    SharedPreferencesHelper.removeData(key: "accessToken");
    emit(UserLogedoutState());
  }

  Future addAddress(String address) async {
    await getUser();
    String? firstName = user!.data!.firstName;
    String? lastName = user!.data!.lastName;
    String? email = user!.data!.email;
    await DioHelper.patchData(
            url: "api/v1/user/me/",
            data: {
              "firstName": firstName,
              "lastName": lastName,
              "email": email,
              "address": address,
            },
            token: SharedPreferencesHelper.getData(key: "accessToken"))
        .then((value) {
      emit(LoadingState());
      print("hello from theen : ${value.data}");
      user = UserResponse.fromJson(value.data);
      emit(UserUpdated());
    }).catchError((error) {
      print('error: ${error.toString()}');
      emit(ErrorState());
    });
  }

  Future updateUser(
      String firstName, String lastName, String email, String? address) async {
    print("start updating user");
    await DioHelper.patchData(
            url: "api/v1/user/me/",
            data: {
              "firstName": firstName,
              "lastName": lastName,
              "email": email,
              "address": address,
            },
            token: SharedPreferencesHelper.getData(key: "accessToken"))
        .then((value) {
      emit(LoadingState());
      print("hello from theen : ${value.data}");
      user = UserResponse.fromJson(value.data);
      emit(UserUpdated());
    }).catchError((error) {
      print('error: ${error.toString()}');
      emit(ErrorState());
    });
  }
}
