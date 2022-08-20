import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/bloc/userCubit/user_cubit.dart';
import 'package:la_vie/core/components/button.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';
import 'package:la_vie/views/profile_screen.dart';

import '../core/components/form_field.dart';
import '../core/components/logo.dart';

class UpdateUserScreen extends StatelessWidget {
  UpdateUserScreen(this.updatedField, this.userCubit, {Key? key})
      : super(key: key) {
    if (updatedField!.contains("email")) {
      enableEmail = true;
    } else {
      enableEmail = false;
    }

    _email = TextEditingController(text: "${userCubit.user!.data!.email}");
    _firstName =
        TextEditingController(text: "${userCubit.user!.data!.firstName}");
    _lastName =
        TextEditingController(text: "${userCubit.user!.data!.lastName}");
  }

  String? updatedField;
  bool? enableEmail;
  UserCubit userCubit;

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController? _email;
  TextEditingController? _firstName;
  TextEditingController? _lastName;

  @override
  Widget build(BuildContext context) {
    double constraintsHight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 42,
              ),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Logo(120)),
                    SizedBox(
                      height: constraintsHight / 20,
                    ),
                    Text(
                      "Update Profile",
                      style: AppTextStyle.defultTextStyle(18),
                    ),
                    SizedBox(
                      height: constraintsHight / 15,
                    ),
                    CustomFormField(
                      enabled: !enableEmail!,
                      readOnly: enableEmail!,
                      controller: _firstName,
                      label: "First Name",
                      validator: (enableEmail!)
                          ? (value) {}
                          : (value) {
                              if (value!.isEmpty || value == null) {
                                return 'First Name is required';
                              }
                            },
                    ),
                    CustomFormField(
                      enabled: !enableEmail!,
                      readOnly: enableEmail!,
                      controller: _lastName,
                      label: "Last Name",
                      validator: (value) {
                        if (value!.length < 1 || value == null) {
                          return 'Lat Name is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomFormField(
                      enabled: enableEmail!,
                      readOnly: !enableEmail!,
                      label: "Email",
                      controller: _email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!value.contains('@') ||
                            !value.contains('.')) {
                          return 'Please enter valid email ex : "example@mail.com"';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: constraintsHight / 30,
                    ),
                    AppButton(
                        onPress: () {
                          //if (_formKey.currentState!.validate()) {
                          if (enableEmail!) {
                            userCubit.updateUser(
                                userCubit.user!.data!.firstName!,
                                userCubit.user!.data!.lastName!,
                                _email!.text,
                                userCubit.user!.data!.address);
                          } else {
                            userCubit.updateUser(
                                _firstName!.text,
                                _lastName!.text,
                                userCubit.user!.data!.email!,
                                "userCubit.user!.data!.address");
                          }
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()),
                              (route) => false);
                          //}
                        },
                        text: "Update"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
