import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:la_vie/bloc/authCubit/auth_cubit.dart';
import 'package:la_vie/core/components/logo.dart';
import 'package:la_vie/core/style/app_text_style/app_text_style.dart';
//import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import '../core/components/button.dart';
import '../core/components/form_field.dart';
import '../core/components/line_text_line.dart';
import '../core/components/links.dart';
import '../services/google_auth.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    double constraintsHight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: constraintsHight / 15,
                          ),
                          Center(child: Logo(102)),
                          SizedBox(
                            height: constraintsHight / 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppLink(
                                text: "Sign UP",
                                enabeled: true,
                                onPress: () {},
                              ),
                              AppLink(
                                text: "Login",
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormField(
                            controller: _firstName,
                            label: "First Name",
                            validator: (value) {
                              if (value!.length < 1 || value == null)
                                return 'First Name is required';
                            },
                          ),
                          CustomFormField(
                            controller: _lastName,
                            label: "Last Name",
                            validator: (value) {
                              if (value!.length < 1 || value == null)
                                return 'Lat Name is required';
                              else
                                return null;
                            },
                          ),
                          CustomFormField(
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
                          CustomFormField(
                            controller: _password,
                            label: "Password",
                            validator: (value) {
                              RegExp regex = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])');
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              if (!regex.hasMatch(value)) {
                                return 'Password should be: \nat least 8 characters\n at least 1 uppercase letter\n at least 1 lowercase letter \n at least 1 special letter \n at least 1 number';
                              }
                              return null;
                            },
                          ),
                          CustomFormField(
                            label: "Confirm Password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              } else if (value != _password.text) {
                                return 'Doesn\'t match password';
                              }
                              return null;
                            },
                          ),
                          AppButton(
                              onPress: () async {
                                if (_formKey.currentState!.validate()) {
                                  print("111111111111");
                                  authCubit
                                      .signUp(_firstName.text, _lastName.text,
                                          _email.text, _password.text)
                                      .then((value) {
                                    if (authCubit.authResponse!.type!
                                        .contains("Success")) {
                                      print("saving doneee");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                      );
                                    }

                                    print("email : ${_email.text}");
                                  });
                                }
                              },
                              text: "Sign UP"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: AppTextStyle.grayTextStyle(8),
                              ),
                              TextButton(
                                child: Text("Sign In",
                                    style:
                                        AppTextStyle.linkTextStyle(11, true)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                  );
                                },
                              ),
                            ],
                          ),
                          LineTextLine("or continue with"),
                          SizedBox(
                            height: 18,
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
                                    //print(this.firstName);
                                    /* if (_formKey.currentState!.validate()) {
                                      await FacebookAuth.instance.accessToken;
                                      var facebookLogin = FacebookLogin();
                                      var result = await facebookLogin.logIn(
                                          permissions: [
                                            FacebookPermission.email
                                          ]);
                                      var accessToken = result.accessToken;
                                      print("token === ${accessToken!.token}");
                                    } */
                                  },
                                  child:
                                      Image.asset("assets/img/Facebook.png")),
                            ],
                          ),
                          SizedBox(
                            height: constraintsHight / 10,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future? signIn() async {
    final user = await GoogleSignInProvider.login();
    if (user == null)
      CircularProgressIndicator();
    else {
      print("user ${user.displayName}");
    }
  }
}
