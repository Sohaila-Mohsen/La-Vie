import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:la_vie/bloc/authCubit/auth_cubit.dart';
import 'package:la_vie/bloc/quizCubit/quiz_cubit.dart';
import 'package:la_vie/core/components/line_text_line.dart';
import 'package:la_vie/core/components/logo.dart';
//import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:la_vie/core/utils/sp_helper/cache_helper.dart';
import 'package:la_vie/views/address_screen.dart';
import 'package:la_vie/views/home_screen.dart';
import '../core/components/button.dart';
import '../core/components/form_field.dart';
import '../core/components/links.dart';
import '../services/google_auth.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    AuthCubit authCubit = AuthCubit.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Image.asset("assets/img/leaves.png"),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Image.asset("assets/img/leave down.png"),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 42,
            ),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Logo(102)),
                    SizedBox(
                      height: constraintsHeight / 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppLink(
                          text: "Sign UP",
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                        ),
                        AppLink(
                          text: "Login",
                          enabeled: true,
                          onPress: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: constraintsHeight / 25,
                    ),
                    CustomFormField(
                      controller: _email,
                      label: "Email",
                      validator: (var value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!value.contains('@') ||
                            !value.contains('.')) {
                          return 'Please enter valid email ex : "example@mail.com"';
                        }
                        return null;
                      },
                    ),
                    CustomFormField(
                      controller: _password,
                      label: "Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: constraintsHeight / 25,
                    ),
                    AppButton(
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            authCubit
                                .signIn(_email.text, _password.text)
                                .then((value) {
                              print("done1 $value");
                              if (!authCubit.authResponse!
                                  .toString()
                                  .contains("error")) {
                                if (SharedPreferencesHelper.getData(
                                        key:
                                            "${SharedPreferencesHelper.getData(key: "accessToken")}") ==
                                    null) {
                                  print("inside cond");
                                  QuizCubit.saveQuizStartDate();
                                }
                                print("saving doneee");
                                if (SharedPreferencesHelper.getData(
                                        key: "isFirst") ==
                                    false) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                      (route) => false);
                                } else {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddressScreen()),
                                      (route) => false);
                                }
                              }
                            });
                          }
                        },
                        text: "Login"),
                    SizedBox(
                      height: constraintsHeight / 38,
                    ),
                    LineTextLine("or continue with"),
                    SizedBox(
                      height: constraintsHeight / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              signIn();
                            },
                            child: Image.asset("assets/img/google.png")),
                        InkWell(
                            onTap: () async {
                              /* await FacebookAuth.instance.accessToken;
                              var facebookLogin = new FacebookLogin();
                              var result = await facebookLogin.logIn(
                                  permissions: [FacebookPermission.email]);
                              var accessToken = result.accessToken;
                              print("token === ${accessToken!.token}"); */
                            },
                            child: Image.asset("assets/img/Facebook.png")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future? signIn() async {
    final user = await GoogleSignInProvider.login();
    if (user == null) {
      const CircularProgressIndicator();
    } else {
      print("user ${user.displayName}");
    }
  }
}
